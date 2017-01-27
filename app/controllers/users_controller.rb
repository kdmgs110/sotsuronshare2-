class UsersController < ApplicationController
before_action :correct_user, only: [:edit, :update]
 
  def index
    @users = User.all
  end
  
  def show
    # params[:id] comes from the URL: /users/:id
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end  
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end
  
  def upvote
    @user = User.find(params[:id])
    @user.upvote_by current_user
    redirect_to back
  end
  
  
  def downvote
    @user = User.find(params[:id])
    @user.downvote_by current_user
    redirect_to back
  end
   
  
 private
  
    def correct_user
      # .to_i converts values to integers here because params[:id] is a string
      # Without this current_user.id and params[:id] would never match
      if current_user.id != params[:id].to_i
        redirect_to root_url
      end
    end
    
    def user_params
      params.require(:user).permit(:bio, :abstract, :thesisName, :attachment, :major)
    end
  
end
class UsersController < ApplicationController
before_action :correct_user, only: [:edit, :update]
before_filter :set_search
 
  def index
    @q        = User.search(params[:q])
    @products = @q.result(distinct: true)
  end
  
  def show
    # params[:id] comes from the URL: /users/:id
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.create(params[:id])
    @user = current_user.follow(@user)
    redirect_to users_path
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
  
  def clip
    @user = current_user.votes.up.for_type(User).votables
  end
  
  def friends
   @friends = current_user.followers_by_type('User')
   #@accept = current_user.accept_request(@user)
  end
  
  def upvote
    @user = User.find(params[:id])
    @user.upvote_by current_user
    redirect_to users_path
  end
  
  def downvote
    @user = User.find(params[:id])
    @user.downvote_by current_user
    redirect_to clip_user_path
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
      params.require(:user).permit(:bio, :abstract, :thesisName, :attachment, :major, :username, :graduate)
    end
  
end
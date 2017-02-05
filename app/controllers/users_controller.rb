class UsersController < ApplicationController
before_action :correct_user, only: [:edit, :update]
before_filter :set_search
 
  def index
    @q        = User.search(params[:q])
    @products = @q.result(distinct: true)
  end
  
  def show
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
   @users = User.find(params[:id])
   @following = @users.all_following
   @followers = @users.followers
   @mutualfriends = @following & @followers
   @pendingfriends = @followers - @following

   #@accept = current_user.accept_request(@user)
  end
  
  def follow
    @user = User.find(params[:id])
    if current_user
      if current_user == @user　
        flash[:error] = "You cannot follow yourself."
      else
        current_user.follow(@user)
        RequestMailer.send_email(@user,current_user).deliver_now
        flash[:notice] = "You are now following #{@user.name}."
        redirect_to @user
      end
    else
      redirect_to root_path
    end
  end

  def unfollow
    @user = User.find(params[:id])
  
    if current_user
      current_user.stop_following(@user)
      flash[:notice] = "You are no longer following #{@user.name}."
      redirect_to @user
    else
      flash[:error] = "You must <a href='/users/sign_in'>login</a> to unfollow #{@user.name}.".html_safe
      redirect_to @user
    end
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
      params.require(:user).permit(:bio, :abstract, :thesisName, :attachment, :major, :username, :graduate, :email)
    end
  
end
class ApplicationController < ActionController::Base
  
        
  def set_friends
     @users = User.find(params[:id])
     @following = @users.all_following
     @followers = @users.followers
     @mutualfriends = @following & @followers
     @current_user_following = current_user.all_following 
     @current_user_followers = current_user.followers
     @currentuser_sending = @current_user_following-@current_user_followers
     @pendingfriends = @current_user_following - @mutualfriends
  end
  
  def set_pending
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @following = @current_user.all_following
    @followers = @current_user.followers
    @mutualfriends = @following & @followers
    @pendingfriends = @followers - @following
  end
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private
  
    def current_user
      begin
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      rescue
        session[:user_id] = nil
        return nil
      end
    end
    
    helper_method :current_user
end
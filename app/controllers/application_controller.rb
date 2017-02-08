class ApplicationController < ActionController::Base
        
  def set_search
    @q        = User.search(params[:q])
    @users = @q.result.paginate(page: params[:page], per_page: params[:per_page])
  end
  
  
  def set_friends
     @users = User.find(params[:id])
     @following = @users.all_following
     @followers = @users.followers
     @mutualfriends = @following & @followers
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
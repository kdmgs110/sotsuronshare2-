class UpvotesController < ApplicationController
    before_action :authenticate_user!
    
    def create
      @user = User.find(params[:user_id]) 
      @user.liked_by current_user
      redirect_to back
    end
end

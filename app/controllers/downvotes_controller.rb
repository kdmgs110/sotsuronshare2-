class DownvotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:id])
    @user.downvote_from current_user
    redirect_to back
  end
end
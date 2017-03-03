class ForumsController < ApplicationController

before_action :authenticate_user
before_action :set_profile, except: [:edit,:update]
before_action :set_pending

    
    def index 
     @forums = Forum.all.order("created_at DESC")
    end
    
    def new 
        @forums = Forum.new
    end
   
    def create 
        @forums = current_user.forums.create(forum_params)
        if @forums.valid?
            redirect_to forums_path
        else
            redirect_to :back
        end
    end
   
    
    def show
        @forums = Forum.find(params[:id])
    end
    
   def edit
        @forums = Forum.find(params[:id])
   end
   
   
   def update
      @forum = forum.find(params[:id])
      @forum.update(forum_params)
      if @forum.valid?
        redirect_to @forum, notice: :"ディスカッションを変更しました"
      else
        render :edit, status: :unprocessable_entity
      end
   end
   
   def destroy
    @forum = Forum.find(params[:id])
    @forum.destroy
    redirect_to forums_path
   end
   
   def upvote
    @forums = Forum.find(params[:id])
    @forums.liked_by current_user
    redirect_to @forums
    end
    
    def downvote
      @forums = Forum.find(params[:id])
      @forums.unliked_by current_user
      redirect_to @forums
    end
    
    def forummajor
    @forums = Forum.where(major: params[:major]).order("created_at DESC")
    end
    
   
   
   # act as votable 
    def authenticate_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        unless current_user.present?
          redirect_to root_path,notice: "ログインしてください"
        end
  end
  
    
  def set_profile
    @user = current_user
    unless @user.username.present?
      redirect_to edit_user_path(current_user),notice: 'プロフィールを編集しましょう！(あとで変更することができます)'
    end
  end
    
private

def forum_params
  params.require(:forum).permit(:content, :user_id, :title, :major, :keyword, :keyword_list)
end

end
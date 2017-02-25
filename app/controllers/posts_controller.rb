class PostsController < ApplicationController
before_filter :set_search
    
    def index 
     @posts = Post.all.order("created_at DESC")
    end
    
    def new 
        @posts = Post.new
    end
    
    def show
        @posts = Post.find(params[:id])
    end
    
    def create
        @post = current_user.posts.create(post_params)
        if @post.valid?
            redirect_to users_path
        else
            render :new, status: :unprocessable_entity
        end
    end
   
   def edit
        @post = Post.find(params[:id])
   end
   
   
   def update
      @post = Post.find(params[:id])
      @post.update(post_params)
      if @post.valid?
        redirect_to @post, notice: :"論文を変更しました"
      else
        render :edit, status: :unprocessable_entity
      end
   end
   
   def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user)
   end
   
   # act as votable 
   
   def upvote
    @post = Post.find(params[:id])
    @post.liked_by current_user
    RequestMailer.like_email(@post.user,current_user).deliver_now
    redirect_to @post
    end
    
    def downvote
      @post = Post.find(params[:id])
      @post.unliked_by current_user
      redirect_to @post
    end
    
    def like
     @user = User.find(params[:id])
     @posts = @user.votes.up.for_type(Post).votables
    end
    
    def papermajor
    @posts = Post.where(major: params[:major])
    end
    
private

def post_params
  params.require(:post).permit(:user_id, :file, :summary, :title, :year, :teacher, :major, :keyword, :keyword_list)
end

end 
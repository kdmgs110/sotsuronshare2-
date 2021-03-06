class CommentsController < ApplicationController
    
    def show
      @comments = Comment.find(params[:id])
    end
    
    def create
      begin Forum.find(params[:forum_id]).present?
        @forum= Forum.find(params[:forum_id])
        @comment = @forum.comments.create(comment_params.merge(user_id: current_user.id))
        if @comment.valid?
          RequestMailer.comment_forum(@forum.user, @comment.user).deliver
          redirect_to @forum
        else
          flash[:alert] = "Invalid attributes."
          redirect_to @forum
        end
      rescue
        @post = Post.find(params[:post_id]) 
        @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
        if @comment.valid?
          RequestMailer.comment_email(@post.user, @comment.user).deliver
          redirect_to @post
        else
          flash[:alert] = "Invalid attributes."
          redirect_to @post
        end
      end
   end

   def destroy
    begin Forum.find(params[:forum_id])
      @forum = Forum.find(params[:forum_id])
      @comment = Comment.find(params[:id])
      @comment.destroy
    redirect_to @forum,notice:"コメントを消去しました"
    rescue
      @post = Post.find(params[:post_id])
      @comment = Comment.find(params[:id])
      @comment.destroy
    redirect_to @post,notice:"コメントを消去しました"
    end
    
   end
   
   
 def upvote
    @comments = Comment.find(params[:id])
    @comments.liked_by current_user
    redirect_to :back
 end
    
  def downvote
    @comments = Comment.find(params[:id])
    @comments.unliked_by current_user
    redirect_to @comments.post
    end

private 

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
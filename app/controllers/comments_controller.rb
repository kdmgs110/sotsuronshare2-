class CommentsController < ApplicationController
    
    def create
        
      @users = User.find(params[:user_id])
      @comments = @users.comments.create(comment_params.merge(user_id: current_user.id))
      if @comments.valid?
        CommentMailer.send_email(@users,current_user).deliver_now
        redirect_to user_path(@users),notice: "コメントを送信しました"
      else
        render :new, status: :unprocessable_entity
      end
    end
    
    def destroy 
        @users = User.find(params[:user_id])
        @comments = @user.comments.all
        @comment  = @user.comments.build(user_id: @user.id)
        @comment.destroy
        redirect_to user_path, notice:"コメントを削除しました"
    end

private

    def comment_params
      params.require(:comment).permit(:user_id, :text)
    end
end

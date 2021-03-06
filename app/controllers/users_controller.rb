class UsersController < ApplicationController
before_action :authenticate_user
before_action :correct_user, only: [:edit, :update]
before_action :set_pending

  def authenticate_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        unless current_user.present?
          redirect_to root_path,notice: "ログインしてください"
        end
  end
  
  def index
    @users = User.all.order("created_at desc")
    case
      when current_user.username.nil?
        then flash[:notice] = "プロフィールを編集しましょう。メールアドレスを入力すると、コンタクト申請を送れるようになります"
      when current_user.email.nil?
        then flash[:notice] = "気になった人にコンタクトをとってみませんか？メールアドレスを登録すると、コンタクトリクエストが送信できます"
    end
  end
  
  def show
    #@user = User.find(params[:id])
   @user = User.find(params[:id])
   @posts = @user.posts.all.order("created_at DESC")
   @comments = @user.comments.all.order("created_at DESC")
   @comment  = @user.comments.build(user_id: current_user.id) 
    unless current_user.name.present? || current_user.bio.present?
    flash[:notice] = "プロフィールから、名前とプロフィール、連絡先を記入すると、#{@user.username}さんと連絡先が交換できます"
    end
  end
  
  def new 
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
      redirect_to dashboard_path
    else
      render 'edit',notice:'#{current_user.username}さんのプロフィールを編集しました'
    end
  end
  
  def clip
    @user = current_user.votes.up.for_type(User).votables
  end
  
  def friends
   @users = User.find(params[:id])
   @current_user = current_user
   @current_user_following = current_user.all_following 
   @current_user_followers = current_user.followers
   @following = @users.all_following
   @followers = @users.followers
   @mutualfriends = @following & @followers
   @pendingfriends = @followers - @following
   @sendingfriends = @following - @followers
   @currentuser_sending = @current_user_following-@current_user_followers
   #@accept = current_user.accept_request(@user)
  end
  
  def follow
    @user = User.find(params[:id])
    if current_user
      if current_user == @user　
        flash[:notice] = "自分自身をフォローできません。"
        redirect_to :back
      else
        current_user.follow(@user)
        RequestMailer.send_email(@user,current_user).deliver_now
        #RequestMailer.send_email(@user,current_user,@message).deliver_now こうすれば理論上届くようになる
        flash[:notice] = "#{@user.username}さんにコンタクトリクエストを送りました。"
        redirect_to :back
      end
    else
      redirect_to :back
    end
  end

  def unfollow
    @user = User.find(params[:id])
    if current_user
      current_user.stop_following(@user)
      redirect_to users_path,notice:"#{@user.username}さんへのコンタクトを取り消しました。"
    else
      flash[:error] = "You must <a href='/users/sign_in'>login</a> to unfollow #{@user.name}.".html_safe
      redirect_to users_path
    end
  end
  
  def upvote
    @user = User.find(params[:id])
    @user.upvote_by current_user
    redirect_to users_path,notice: "#{@user.username}さんの論文をクリップしました。"
  end
  
  def downvote
    @user = User.find(params[:id])
    @user.downvote_by current_user
    redirect_to users_path,notice:"#{@user.username}さんの論文からクリップを外しました"
  end
  
  def major
    @users = User.where(major: params[:major])
  end
  
  def set_profile
    @user = current_user
    unless @user.username.present?
      redirect_to edit_user_path(current_user),notice: 'プロフィールを編集しましょう！(あとで変更することができます)'
    end
    
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
      params.require(:user).permit(:bio, :abstract, :thesisName, :attachment, :major, :username, :graduate, :email, :interest_list, :years, :twitter_id,:people)
    end
  
end
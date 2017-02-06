class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to users_url,notice:"ログインしました。ユーザの編集は済みましたか？右上の設定ページから編集しましょう。"
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url,notice:"ログアウトしました"
  end
end
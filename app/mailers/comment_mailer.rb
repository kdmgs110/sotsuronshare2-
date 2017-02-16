class CommentMailer < ApplicationMailer
    
     default from: "info.sotsuronshare@gmail.com"
    
    def send_email(user,current_user)
        @email = user.email #ここは送信で使う
        @name = user.username #ここはメールで使う
        @username = user.username
        @current_username = current_user.username
        mail to: @email, subject: "【卒論Share】#{@current_username}さんがあなたのプロフィールにコメントしました。"
    end
    
    def approve_request(user,current_user)
       @email = user.email
       mail to: @email, subject:'【卒論Share】】#{@current_username}さんがあなたのプロフィールにコメントしました。' 
    end
end

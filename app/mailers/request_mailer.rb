class RequestMailer < ApplicationMailer
    default from: "info.sotsuronshare@gmail.com"
    
    def send_email(user,current_user)
        @email = user.email #ここは送信で使う
        @name = user.username #ここはメールで使う
        @username = user.username
        @current_username = current_user.username
        mail to: @email, subject: "【卒論Share】#{@current_username}さんからコンタクトリクエストが届きました"
    end
    
    def approve_request(user,current_user)
       @email = user.email
       mail to: @email, subject:'【CurioCity】コンタクトリクエストが承認されました' 
    end
    
    def comment_email(user,current_user)
        @email = user.email
        @current_user= current_user
        mail to: @email, subject: '【CurioCity】コメントが届きました。'
    end
    
    def like_email(user,current_user)
        @email = user.email
        mail to: @email, subject: '【CurioCity】あなたの論文にいいねが押されました。'
    end
    
    
end

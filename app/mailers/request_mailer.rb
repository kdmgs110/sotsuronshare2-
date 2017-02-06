class RequestMailer < ApplicationMailer
    default from: "info.sotsuronshare@gmail.com"
    
    def send_email(user,current_user)
        @email = user.email #ここは送信で使う
        @name = user.username #ここはメールで使う
        @current_user = current_user.username
        mail to: @email, subject: "【卒論Share】コンタクトリクエストが届きました"
    end
    
    def approve_request(user,current_user)
       @email = user.email
       @name = current_user.username
       mail to: @email, subject:'【卒論Share】コンタクトリクエストが承認されました' 
    end
    
end

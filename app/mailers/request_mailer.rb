class RequestMailer < ApplicationMailer
    default from: "kdmgs110@gmail.com"
    
    def send_email(user,current_user)
        @email = user.email #ここは送信で使う
        @name = user.username #ここはメールで使う
        @current_user = current_user.username
        mail to: @email, subject: "【卒論Share】フレンドリクエストが届きました"
    end
end

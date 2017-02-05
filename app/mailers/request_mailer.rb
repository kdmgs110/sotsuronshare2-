class RequestMailer < ApplicationMailer
    default from: "kdmgs110@gmail.com"
    
    def send_email(user)
        @email = user.email #ここは送信で使う
        @name = user.username #ここはメールで使う
        mail to: @email, subject: "【卒論Share】フレンドリクエストが届きました"
    end
end

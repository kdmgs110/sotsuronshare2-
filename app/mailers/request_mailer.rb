class RequestMailer < ApplicationMailer
    default from: "info.sotsuronshare@gmail.com"
    
    def send_email(user,current_user)
        @email = user.email #ここは送信で使う
        @name = user.username #ここはメールで使う
        @username = user.username
        @current_user = current_user
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
        mail to: @email, subject: '【CurioCity】論文へのコメントが届きました。'
    end
    
    def comment_forum(user,current_user)
        @email = user.email
        @current_user= current_user
        mail to: @email, subject: '【CurioCity】質問へのコメントが届きました。'
    end
    
    
    
    def like_email(user,current_user)
        @current_user= current_user
        @email = user.email
        mail to: @email, subject: '【CurioCity】あなたの論文にいいねが押されました。'
    end
    
    def forum_notification(users,current_user,forums)
        @email = users.email #ここは送信で使う
        @name = users.username #ここはメールで使う
        @current_user = current_user
        @forums = forums.major
        mail to: @email, subject: "【CurioCity】#{@current_user}さんが、#{@current_user.major}についての質問をしました"
    end
    
    
    
end

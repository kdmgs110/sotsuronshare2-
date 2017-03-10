class StaticPagesController < ApplicationController
before_action :set_pending, except: [:home,:terms,:profile,:dashboard]

    def home 
        if current_user.present?
         redirect_to users_path,notice: "#{current_user.name}さんとしてログインしています"
        end
    end
    
    def terms
        if current_user.present?
            set_pending
        end
    end
    
    def profile
        if current_user.present?
            set_pending
        end
    end
    
    def dashboard
        if current_user.present? #ログインしてたら
            set_pending
            @major = current_user.major #現在のユーザーのメジャーを取得
            @users = User.where("major = ?", @major) #現在のユーザーのメジャーと同一のメジャーのすべてを取り出す
            @posts = Post.where("major = ?", @major)
            @forums = Forum.where("major = ?",@major)
            
        else
            redirect_to root_path
        end
       
    end

end

class StaticPagesController < ApplicationController
before_action :set_pending

    def home 
        if current_user.present?
         redirect_to users_path,notice: "#{current_user.name}さんとしてログインしています"
        end
    end
    
    def terms
        
    end
end

class StaticPagesController < ApplicationController
before_filter :set_search
    def home 
        if current_user.present?
         redirect_to users_path,notice: "#{current_user.name}さんとしてログインしています"
        end
    end
    
    def terms
        
    end
end

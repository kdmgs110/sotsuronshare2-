class StaticPagesController < ApplicationController
before_action :set_pending, except: [:home,:terms,:profile]


    def home 
        if current_user.present?
         redirect_to users_path,notice: "#{current_user.name}さんとしてログインしています"
        end
    end
    
    def terms
        
    end
    
    def profile
    end
end

class User < ActiveRecord::Base
  
  acts_as_voter
  acts_as_votable
  
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  
  # Initializes or updates user object when logging in with Facebook
  def self.from_omniauth(auth)
    where(fb_id: auth.uid).first_or_create do |user|
      user.oauth_provider = auth.provider
      user.fb_id = auth.uid
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.name ||= auth.info.name
      user.avatar_url ||= "http://graph.facebook.com/#{auth.uid}/picture?width=500"
      user.save!
    end
  end
  
  def facebook #koalaのtutorial参考
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    
  end
  
  def friends
   @friends = facebook.get_connections("me", "friends")
  end
end

  
  

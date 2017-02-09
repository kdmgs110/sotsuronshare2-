class User < ActiveRecord::Base
  
  acts_as_taggable_on :labels # post.label_list が追加される
  acts_as_taggable            # acts_as_taggable_on :tags のエイリアス
  acts_as_ordered_taggable_on :interests
  #http://ruby-rails.hatenadiary.com/entry/20150225/1424858414
  
  acts_as_voter
  acts_as_votable
  
  acts_as_followable
  acts_as_follower
  
  has_friendship
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
  
  validates :username,     length: { maximum: 40 }        # 値が「2文字以上」であれば有効
  validates :bio,      length: { maximum: 1000 }
  validates :abstract,      length: { maximum: 1000 }# 値が「500文字以下」であらば有効
end

  
  

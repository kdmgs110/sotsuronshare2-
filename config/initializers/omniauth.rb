Rails.application.config.middleware.use OmniAuth::Builder do
 provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
 scope: "email,user_education_history,user_friends"
end
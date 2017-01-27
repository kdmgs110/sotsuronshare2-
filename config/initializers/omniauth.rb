Rails.application.config.middleware.use OmniAuth::Builder do
 #provider :facebook, ENV['353667681638505'], ENV['2f957e1f8e4fcfb6742506115f2f2dd0']
 provider :facebook,'353667681638505', '2f957e1f8e4fcfb6742506115f2f2dd0', scope: "email,user_education_history,user_friends"
 end
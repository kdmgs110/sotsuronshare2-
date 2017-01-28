Rails.application.config.middleware.use OmniAuth::Builder do
 #provider :facebook, ENV['353667681638505'], ENV['2f957e1f8e4fcfb6742506115f2f2dd0']
 provider :facebook,'1664698063822824', 'db98fd965b145f14bcd1c1606188d160', scope: "email,user_education_history,user_friends"、:client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}
 end
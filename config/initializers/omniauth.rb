#Rails.application.config.middleware.use OmniAuth::Builder do
#    provider :twitter, Rails.application.secrets.twitter_api_key, Rails.application.secrets.twitter_api_secret
#  
#end
#Rails.application.config.middleware.use OmniAuth::Builder do
#  provider :twitter, "Jo6Jm2sIAoMLurZ4Eo1ShDFgW", "1EEzqxJqeqxwJ4Fien0svSMSzkKlosXpKlwQwFzJphqmaEiXwB"
#end


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['Jo6Jm2sIAoMLurZ4Eo1ShDFgW'], ENV['1EEzqxJqeqxwJ4Fien0svSMSzkKlosXpKlwQwFzJphqmaEiXwB']
end
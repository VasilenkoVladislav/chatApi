Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_API_KEY'], ENV['FACEBOOK_API_SECRET'],
           info_fields: 'email, first_name, last_name'

  provider :twitter, ENV['TWITTER_API_KEY'], ENV['TWITTER_API_SECRET']

  provider :google_oauth2, ENV['GOOGLE_API_ID'], ENV['GOOGLE_API_SECRET'],
           verify_iss: false
end
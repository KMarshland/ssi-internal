Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_PUBLIC'], ENV['GOOGLE_SECRET']
end
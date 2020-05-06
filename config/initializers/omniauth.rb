Rails.application.config.middleware.use Omniauth::Builder do 
    provider :google_oauth2, ENV['GOOGLE_CLIENT_KEY'], ENV['GOOGLE_CLIENT_SECRET']
end
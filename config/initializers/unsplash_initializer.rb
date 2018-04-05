=begin
require '../config/application.yml'
require '../config/secrets.yml'
Unsplash.configure do |config|
  config.application_id     = UNSPLASH_ID
  config.application_secret = UNSPLASH_SECRET
  config.application_redirect_uri = MY_URI
  config.utm_source = "feira-da-maca-app"
end
=end

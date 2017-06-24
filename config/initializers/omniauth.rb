OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1852259071691950', 'e53f6fc63367031161e67c699e1d8cc2', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
  provider :twitter, Rails.application.secrets.twitter_api_key, Rails.application.secrets.twitter_api_secrets
end

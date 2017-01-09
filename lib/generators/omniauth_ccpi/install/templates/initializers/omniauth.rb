require 'omniauth/strategies/ccpi'

OmniAuth::Ccpi.setup do |config|
  # ==> Configuration for Multiple Organizations
  # Setting to true will allow the application to use
  # organizational switching, allowing members to view
  # more than one user/organizations data at a time
  # the default for this value is "true"
  # config.enable_organizations = ENV["OMNIAUTH_HUB_ENABLE_ORGANIZATIONS"]

  # ==> Configuration for authentication host
  # Configure the host which will provide authentication for the application.
  # By default, this is "https://gleason.gleasontech.com".
  config.provider_url = ENV["OMNIAUTH_CCPI_PROVIDER_URL"]

  # ==> Configuration for Application ID provided by
  # Ccpi for authentication
  config.omniauth_ccpi_app_id = ENV["OMNIAUTH_CCPI_APP_ID"]

  # ==> Configuration for Application Secret provided
  # by Ccpi for authentication
  config.omniauth_ccpi_app_secret = ENV["OMNIAUTH_CCPI_APP_SECRET"]
end

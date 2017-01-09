require 'rails'

module OmniAuth
  module Ccpi

    # Enables organization support using the gem
    mattr_accessor :enable_organizations
    @@enable_organizations = true

    # Sets the provider url omniauth
    mattr_accessor :provider_url
    @@provider_url = "https://localhost:3000"

    # Sets the omniauth application id
    mattr_accessor :omniauth_ccpi_app_id
    @@omniauth_ccpi_app_id = ""

    mattr_accessor :omniauth_ccpi_app_secret
    @@omniauth_ccpi_app_secret = ""

    def self.setup
      yield self
    end
  end
end

require "omniauth/ccpi/engine"

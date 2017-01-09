require "omniauth/strategies/ccpi"
require "omniauth/ccpi/controller_extensions"
require "omniauth/ccpi/concerns/sentient_model"

module OmniAuth
  module Ccpi
    class Engine < ::Rails::Engine
      initializer 'omniauth.ccpi.application_controller' do |app|
        ActiveSupport.on_load(:action_controller) do
          include OmniAuth::Ccpi::ControllerExtensions
        end
      end

      initializer "omniauth.ccpi.configure_strategy" do |app|
        # Setup Ccpi Ccpi OmniAuth Strategy
        app.middleware.use ::OmniAuth::Strategies::Ccpi,
                              OmniAuth::Ccpi.omniauth_ccpi_app_id,
                              OmniAuth::Ccpi.omniauth_ccpi_app_secret,
                              client_options: { site: OmniAuth::Ccpi.provider_url}
      end
    end
  end
end

require "omniauth/strategies/ccpi"
require "omniauth/ccpi/controller_extensions"
require "omniauth/ccpi/concerns/sentient_model"

module OmniAuth
  module CCPi
    class Engine < ::Rails::Engine
      initializer 'omniauth.ccpi.application_controller' do |app|
        ActiveSupport.on_load(:action_controller) do
          include OmniAuth::CCPi::ControllerExtensions
        end
      end

      initializer "omniauth.ccpi.configure_strategy" do |app|
        # Setup CCPi CCPi OmniAuth Strategy
        app.middleware.use ::OmniAuth::Strategies::CCPi,
                              OmniAuth::CCPi.omniauth_ccpi_app_id,
                              OmniAuth::CCPi.omniauth_ccpi_app_secret,
                              client_options: { site: OmniAuth::CCPi.provider_url}
      end
    end
  end
end

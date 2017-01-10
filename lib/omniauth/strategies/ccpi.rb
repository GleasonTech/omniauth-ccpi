require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Ccpi < OmniAuth::Strategies::OAuth2
      option :name, :ccpi
      option :client_options, {
        site: OmniAuth::Ccpi.provider_url,
        authorize_url:    "/oauth/authorize",
        access_token_url: "/oauth/access_token"
      }

      uid { raw_info['id'] }

      info do
        {
          name:  raw_info['info']['name'],
          email: raw_info['info']['email']
        }
      end

      extra do
        {
          access_level:  raw_info['extra']['access_level'] || :client
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/api/v1/profile.json").parsed
        Rails.logger.info @raw_info
        Rails.logger.info "* Show me extra *************************************"
        Rails.logger.info @raw_info['extra']
        @raw_info
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end

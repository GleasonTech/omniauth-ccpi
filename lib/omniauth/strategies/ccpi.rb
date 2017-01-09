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
          name:  raw_info['name'],
          email: raw_info['email']
        }
      end

      #extra do
      #  {
      #    status:           raw_info['extra']['status']           || "",
      #    is_organization:  raw_info['extra']['is_organization']  || false,
      #    is_admin:         raw_info['extra']['is_admin']         || false
      #  }
      #end
      def raw_info
        @raw_info ||= access_token.get("/api/v1/profile.json").parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end

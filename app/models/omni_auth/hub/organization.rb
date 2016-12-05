require "active_resource"

class OmniAuth::CCPi::Organization < ActiveResource::Base
  self.site = "#{OmniAuth::CCPi.provider_url}/api"

  self.primary_key = :uid

  self.user     = OmniAuth::CCPi.omniauth_entropi_app_id
  self.password = OmniAuth::CCPi.omniauth_entropi_app_secret

  def users
    self.get(:users)
  end
end

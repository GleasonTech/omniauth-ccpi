require "active_resource"

class OmniAuth::Ccpi::Organization < ActiveResource::Base
  self.site = "#{OmniAuth::Ccpi.provider_url}/api"

  self.primary_key = :uid

  self.user     = OmniAuth::Ccpi.omniauth_ccpi_app_id
  self.password = OmniAuth::Ccpi.omniauth_ccpi_app_secret

  def users
    self.get(:users)
  end
end

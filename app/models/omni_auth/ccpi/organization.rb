class OmniAuth::Ccpi::Organization < ActiveRecord::Base
  self.site = "#{OmniAuth::Ccpi.provider_url}/api"

  self.primary_key = :uid

  self.user     = OmniAuth::Ccpi.omniauth_ccpi_app_id
  self.password = OmniAuth::Ccpi.omniauth_ccpi_app_secret

  def users
    
  end
end

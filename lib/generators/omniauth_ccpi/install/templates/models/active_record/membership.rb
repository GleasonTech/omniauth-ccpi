class Membership < ActiveRecord::Base
  belongs_to :user,         foreign_key: "user_id",         class_name: "User"
  belongs_to :organization, foreign_key: "organization_id", class_name: "User"
  
end

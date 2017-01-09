class User < ActiveRecord::Base
  self.primary_key = "uid"

  has_many :organization_memberships, foreign_key: "user_id",         class_name: "Membership"
  has_many :user_memberships,         foreign_key: "organization_id", class_name: "Membership"

  has_many :organizations, through: :organization_memberships, source: :organization
  has_many :users,         through: :user_memberships,         source: :user

  def self.by_is_organization(is_organization)
    where("is_organization = ?", is_organization)
  end
end

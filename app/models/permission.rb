class Permission < ApplicationRecord
  has_many :permissions_roles, dependent: :destroy
  has_many :roles, through: :permissions_roles
end

class Role < ApplicationRecord
  has_many :admins
  has_many :permissions_roles, dependent: :destroy
  has_many :permissions, through: :permissions_roles
  validates :name, presence: true, uniqueness: true
end

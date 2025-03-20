class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :first_time_login
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  enum :admin_type, [ :super_admin, :customer, :staff_user ]
  belongs_to :role, optional: true
  has_one_attached :avatar

  # validates :password, format: { 
  #   with: /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/,
  #   message: "must include at least one lowercase letter, one uppercase letter, one digit, and one special character"
  # }

  before_save :manage_role

  def manage_role
    if self.customer?
      self.role_id = 1
    end
  end
end

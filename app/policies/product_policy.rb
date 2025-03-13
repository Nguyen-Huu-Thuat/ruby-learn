class ProductPolicy < ApplicationPolicy
  attr_reader :admin

  def initialize(admin, record)
    @admin = admin
    @record = record
  end

  def create_product?
    admin.super_admin? || admin.role.permission_ids.include?(1)
  end

  def update_product?
    admin.super_admin? || admin.role.permission_ids.include?(2)
  end

  def delete_product?
    admin.super_admin? || admin.role.permission_ids.include?(3)
  end

  def view_product?
    admin.super_admin? || admin.role.permission_ids.include?(4)
  end
end

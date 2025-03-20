class AddRoleToAdmin < ActiveRecord::Migration[8.0]
  def change
    add_reference :admins, :role, null: false, foreign_key: true, default: 1
  end
end

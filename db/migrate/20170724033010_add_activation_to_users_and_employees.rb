class AddActivationToUsersAndEmployees < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :activation_digest, :string
    add_column :users, :activated, :boolean, default: false
    add_column :users, :activated_at, :datetime
    add_column :employees, :activation_digest, :string
    add_column :employees, :activated, :boolean, default: false
    add_column :employees, :activated_at, :datetime
  end
end

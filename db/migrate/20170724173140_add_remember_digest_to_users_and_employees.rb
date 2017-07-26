class AddRememberDigestToUsersAndEmployees < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :remember_digest, :string
    add_column :users, :remember_digest, :string
  end
end

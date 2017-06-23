class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :full_name
      t.string :email
      t.string :phone_number
      t.text :bio
      t.string :image
      t.boolean :admin
      t.string :password_digest

      t.timestamps
    end
  end
end

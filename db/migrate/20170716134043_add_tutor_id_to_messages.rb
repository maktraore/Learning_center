class AddTutorIdToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :tutor_id, :integer
  end
end

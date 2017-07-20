class RemoveBodyFromChatrooms < ActiveRecord::Migration[5.0]
  def change
    remove_column :chatrooms, :body, :string
  end
end

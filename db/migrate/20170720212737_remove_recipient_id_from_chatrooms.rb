class RemoveRecipientIdFromChatrooms < ActiveRecord::Migration[5.0]
  def change
    remove_column :chatrooms, :sender_id, :integer
    remove_column :chatrooms, :recipient_id, :integer
    remove_column :messages, :email, :string
    remove_column :messages, :tutor_id, :integer
  end
end

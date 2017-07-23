class ChangeReadAttributeToFalseByDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:messages, :read, :false)
  end
end

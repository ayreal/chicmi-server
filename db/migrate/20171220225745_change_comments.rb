class ChangeComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :event_id, :integer
    add_column :comments, :user_id, :integer
    remove_column :comments, :user_event_id
  end
end

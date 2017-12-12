class AddUserEventsToComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :user_id
    remove_column :comments, :event_id
    add_column :comments, :user_event_id, :integer
  end
end

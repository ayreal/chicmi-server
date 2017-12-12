class CreateUserDesigners < ActiveRecord::Migration[5.1]
  def change
    create_table :user_designers do |t|
      t.integer :user_id
      t.integer :designer_id

      t.timestamps
    end
  end
end

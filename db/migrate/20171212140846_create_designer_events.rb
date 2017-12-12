class CreateDesignerEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :designer_events do |t|
      t.integer :designer_id
      t.integer :event_id

      t.timestamps
    end
  end
end

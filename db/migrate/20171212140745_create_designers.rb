class CreateDesigners < ActiveRecord::Migration[5.1]
  def change
    create_table :designers do |t|
      t.string   :external_id
      t.string   :designer_name_en
      t.boolean  :is_following, :default => false

      t.timestamps
    end
  end
end

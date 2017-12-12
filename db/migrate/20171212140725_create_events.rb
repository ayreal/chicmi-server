class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string   :external_id
      t.string   :address_business_name
      t.string   :address_street_1
      t.string   :address_street_2
      t.string   :slug
      t.string   :address_city
      t.string   :address_zip
      t.string   :event_name_en
      t.string   :start_date
      t.string   :end_date
      t.string   :summary
      t.string   :is_hot, :default => "0"
      t.timestamps
    end
  end
end

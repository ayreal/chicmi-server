class AddLongitudeAndLatitudeToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :longitude, :string
    add_column :events, :latitude, :string
    add_column :events, :event_logo_pin, :string
  end
end

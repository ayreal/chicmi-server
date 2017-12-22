class AddLongitudeAndLatitudeToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :longitude, :float
    add_column :events, :latitude, :float
    add_column :events, :event_logo_pin, :string
  end
end

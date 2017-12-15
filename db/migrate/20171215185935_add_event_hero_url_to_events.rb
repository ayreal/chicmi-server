class AddEventHeroUrlToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :event_hero_url, :string
  end
end

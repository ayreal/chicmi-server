class AddColumnsToDesigner < ActiveRecord::Migration[5.1]
  def change
    add_column :designers, :facebook, :string
    add_column :designers, :instagram, :string
    add_column :designers, :website, :string
    add_column :designers, :twitter, :string
    add_column :designers, :type_name, :string
    add_column :designers, :slug, :string
    add_column :designers, :designer_hero_card_url, :string

  end
end

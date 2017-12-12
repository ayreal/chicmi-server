class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :email
      t.string  :photo
      t.integer :city_id
      t.string  :username
      t.string  :twitter
      t.string  :instagram
      t.text    :bio
      t.string  :password_digest
      t.timestamps
    end
  end
end

class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :profile
      t.decimal :money
      t.text :address 
      t.string :image
      t.timestamps
    end
  end
end

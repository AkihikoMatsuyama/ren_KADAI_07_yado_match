class AddDetailsToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :rm_id, :integer
    add_column :reservations, :money, :integer
    add_column :reservations, :price, :integer
  end
end

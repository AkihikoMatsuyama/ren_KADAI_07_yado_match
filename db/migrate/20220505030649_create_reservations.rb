class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.datetime :start_day
      t.datetime :end_day
      t.integer :person
      t.timestamps
    end
  end
end

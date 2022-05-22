class AddDetailsToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :start_day, :datetime
    add_column :rooms, :end_day, :datetime
    add_column :rooms, :check_yoyaku, :boolean
  end
end

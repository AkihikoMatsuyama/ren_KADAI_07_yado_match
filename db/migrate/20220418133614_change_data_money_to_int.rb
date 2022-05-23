class ChangeDataMoneyToInt < ActiveRecord::Migration[7.0]
  def change
    change_column :rooms, :money, :int
  end
end

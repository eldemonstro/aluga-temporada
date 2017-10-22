class ChangeColumnsFromStringToIntegerInProperty < ActiveRecord::Migration[5.1]
  def change
    change_column :properties, :area, :integer
    change_column :properties, :rooms, :integer
    change_column :properties, :maximum_occupancy, :integer
    change_column :properties, :maximum_rent_days, :integer
    change_column :properties, :minimum_rent_days, :integer
    change_column :properties, :daily_rate, :decimal
  end
end

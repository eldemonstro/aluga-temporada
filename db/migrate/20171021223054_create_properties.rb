class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :title
      t.references :location, foreign_key: true
      t.string :area
      t.references :property_type, foreign_key: true
      t.string :rooms
      t.string :maximum_occupancy
      t.string :maximum_rent_days
      t.string :minimum_rent_days
      t.string :daily_rate
      t.text :description
      t.text :usage_rules

      t.timestamps
    end
  end
end

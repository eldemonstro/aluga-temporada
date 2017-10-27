class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.string :user_name
      t.string :email
      t.date :start_date
      t.date :end_date
      t.text :purpose
      t.numeric :total_guests
      t.decimal :total_amount

      t.timestamps
    end
  end
end

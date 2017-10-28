class CreateOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :owners do |t|
      t.string :email
      t.string :password
      t.string :document

      t.timestamps
    end
  end
end

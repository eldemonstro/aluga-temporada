class ChangeTotalGuestsToIntegerFromProposal < ActiveRecord::Migration[5.1]
  def change
    change_column :proposals, :total_guests, :integer
  end
end

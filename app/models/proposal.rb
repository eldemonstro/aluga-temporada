class Proposal < ApplicationRecord
  belongs_to :property

  before_save :calculate_total_amount

  validates :user_name, :email, :start_date, :end_date, :purpose,
            :total_guests, presence: true

  private

  def calculate_total_amount
    date_diff = (end_date - start_date).to_i
    self.total_amount = property.daily_rate * date_diff
  end
end

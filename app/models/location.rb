# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  state      :string
#  city       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ApplicationRecord
  has_many :properties

  def city_with_state
    "#{city} - #{state}"
  end
end

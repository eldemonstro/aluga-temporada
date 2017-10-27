# == Schema Information
#
# Table name: properties
#
#  id                :integer          not null, primary key
#  title             :string
#  location_id       :integer
#  area              :integer
#  property_type_id  :integer
#  rooms             :integer
#  maximum_occupancy :integer
#  maximum_rent_days :integer
#  minimum_rent_days :integer
#  daily_rate        :decimal(, )
#  description       :text
#  usage_rules       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Property < ApplicationRecord
  belongs_to :location
  belongs_to :property_type

  validates :title, :maximum_occupancy, :maximum_rent_days, :minimum_rent_days,
            :daily_rate, :description, :usage_rules, presence: true
end

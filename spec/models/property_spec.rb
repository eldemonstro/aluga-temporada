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

require 'rails_helper'

RSpec.describe Property, type: :model do
end

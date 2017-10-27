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

FactoryBot.define do
  factory :property do
    title 'Sítio do picapau amarelo'
    location
    area 200
    property_type
    rooms 6
    maximum_occupancy 30
    minimum_rent_days 1
    maximum_rent_days 20
    daily_rate 200
    description 'Sítio para passar as férias'
    usage_rules 'Não pode cachorro'
  end
end

# == Schema Information
#
# Table name: property_types
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :property_type do
    title 'Sítio'
  end
end

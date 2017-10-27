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

FactoryBot.define do
  factory :location do
    state 'São Paulo'
    city 'Campinas'
  end
end

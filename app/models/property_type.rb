# == Schema Information
#
# Table name: property_types
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PropertyType < ApplicationRecord
  has_many :properties
end

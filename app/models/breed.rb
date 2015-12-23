# == Schema Information
#
# Table name: breeds
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Breed < ActiveRecord::Base
  has_many :cats
  validates :name, presence: true, length: { minimum: 2, maximum: 30, allow_blank: true }
end

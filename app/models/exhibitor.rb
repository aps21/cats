# == Schema Information
#
# Table name: exhibitors
#
#  id            :integer          not null, primary key
#  cat_id        :integer          not null
#  exhibition_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Exhibitor < ActiveRecord::Base
  belongs_to :exhibition
  belongs_to :cat

  validates :cat, presence: true
  validates :exhibition, presence: true

end

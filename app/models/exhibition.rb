# == Schema Information
#
# Table name: exhibitions
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  start_date :date
#  end_date   :date
#  city       :string           not null
#  address    :string
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Exhibition < ActiveRecord::Base
  has_many :exhibitors
  has_many :cats, through: :exhibitors

  validates :name, presence: true, length: { minimum: 4, maximum: 40, allow_blank: true }
  validate :start_date_cannot_be_more_than_end_date
  validates :city, presence: true, length: { minimum: 3, maximum: 20, allow_blank: true }

  private
  def start_date_cannot_be_more_than_end_date
    return unless start_date.present? && end_date.present? && start_date > end_date
    errors.add(:start_date, :cannot_be_more_than_end_date)
  end
end

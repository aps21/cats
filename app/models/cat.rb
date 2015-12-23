# == Schema Information
#
# Table name: cats
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  birthdate  :date
#  ownered_by :integer
#  neutered   :boolean
#  sex        :integer          not null
#  vaccinated :boolean
#  on_sale    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  breed_id   :integer          not null
#

class Cat < ActiveRecord::Base
  has_many :exhibitors
  has_many :exhibitions, through: :exhibitors
  belongs_to :breed

  enum sex: { male: 1, female: 2 }
  enum ownered_by: { bought: 1, born: 2 }

  validates :name, presence: true, length: { minimum: 2, maximum: 30, allow_blank: true }
  validate :birthdate_cannot_be_today
  validates :sex, presence: true
  validates :breed_id, presence: true

  def age
    birthdate.find_age
  end

  private
  def birthdate_cannot_be_today
    return unless birthdate.present? && birthdate >= Date.today
    errors.add(:birthdate, :cannot_be_today)
  end
end

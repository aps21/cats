require 'rails_helper'

RSpec.describe Exhibition, type: :model do
  context 'associations' do
    it { is_expected.to have_many :exhibitors }
    it { is_expected.to have_many(:cats).through(:exhibitors) }
  end
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(4).is_at_most(40) }

    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_length_of(:city).is_at_least(3).is_at_most(20) }

    it 'start_date_cannot_be_more_than_end_date' do
      exhibition = Exhibition.new(start_date: Date.today, end_date: 1.day.ago)
      expect(exhibition).to have(1).errors_on(:start_date)
      exhibition.end_date = Date.today
      expect(exhibition).to have(0).errors_on(:start_date)
      exhibition.end_date = Date.tomorrow
      expect(exhibition).to have(0).errors_on(:start_date)
    end

  end
end

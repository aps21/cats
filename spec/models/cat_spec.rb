require 'rails_helper'

RSpec.describe Cat, type: :model do
  context 'associations' do
    it { is_expected.to have_many :exhibitors }
    it { is_expected.to have_many(:exhibitions).through(:exhibitors) }
    it { is_expected.to belong_to :breed }
  end
  context 'enum' do
    it { is_expected.to define_enum_for(:sex).with(male: 1, female: 2) }
    it { is_expected.to define_enum_for(:ownered_by).with(bought: 1, born: 2) }
  end
  context 'validations' do
    it { is_expected.to validate_presence_of(:sex) }
    it { is_expected.to validate_presence_of(:breed_id) }
    context 'name' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(30) }
    end
    context 'birthdate' do
      it 'validates birthdate_cannot_be_today' do
        cat = Cat.new(birthdate: Date.tomorrow)
        expect(cat).to have(1).errors_on(:birthdate)
        cat.birthdate = 1.day.ago
        expect(cat).to have(0).errors_on(:birthdate)
      end
    end
  end
end

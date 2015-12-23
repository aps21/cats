require 'rails_helper'

RSpec.describe Breed, type: :model do
  context 'associations' do
    it { is_expected.to have_many :cats }
  end
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(30) }
  end
end

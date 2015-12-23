require 'rails_helper'

RSpec.describe Exhibitor, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :exhibition }
    it { is_expected.to belong_to :cat }
  end
  context 'validations' do
    it { is_expected.to validate_presence_of :cat }
    it { is_expected.to validate_presence_of :exhibition }
  end
end

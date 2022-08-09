require 'rails_helper'

RSpec.describe Operation, type: :model do
  subject { build(:operation) }

  it { is_expected.to validate_presence_of(:kind) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }

  it { is_expected.to belong_to(:account) }
end

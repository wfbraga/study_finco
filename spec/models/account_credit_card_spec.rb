require 'rails_helper'

RSpec.describe AccountCreditCard, type: :model do
  subject { build(:account_credit_card) }

  let(:account) { build(:account) }
  let(:user) { build(:user) }

  it { is_expected.to belong_to(:account) }
  it { is_expected.to belong_to(:owner) }

  it { is_expected.to validate_presence_of(:bank) }
  it { is_expected.to validate_presence_of(:brand) }
  it { is_expected.to validate_presence_of(:credit_limit) }

  it { is_expected.to validate_numericality_of(:credit_limit).is_greater_than(0) }
end

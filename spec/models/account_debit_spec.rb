require 'rails_helper'

RSpec.describe AccountDebit, type: :model do
  subject { build(:account_debit) }

  let(:account) { build(:account) }
  let(:user) { build(:user) }

  it { is_expected.to belong_to(:account) }
  it { is_expected.to belong_to(:owner) }

  it { is_expected.to validate_presence_of(:bank) }
  it { is_expected.to validate_presence_of(:number) }
end

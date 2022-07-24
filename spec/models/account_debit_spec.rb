require 'rails_helper'

RSpec.describe AccountDebit, type: :model do
  subject { build(:account_debits) }
  let(:account) { build(:account) }
  let(:user) { build(:user) }

  it { is_expected.to belong_to :account }
  it { is_expected.to belong_to :user }

  it { is_expected.to validate presence of :bank }
  it { is_expected.to validate presence of :number }
end

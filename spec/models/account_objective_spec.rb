require 'rails_helper'

RSpec.describe AccountObjective, type: :model do
  subject { build(:account_objective) }

  it { is_expected.to belong_to(:account) }
  it { is_expected.to belong_to(:owner) }

  it { is_expected.to validate_presence_of(:target_name) }
  it { is_expected.to validate_presence_of(:target_amount) }

  it { is_expected.to validate_numericality_of(:target_amount).is_greater_than( 0 ) }
end

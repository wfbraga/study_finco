require 'rails_helper'

RSpec.describe InstallmentPurchase, type: :model do
  subject { build(:installment_purchase) }
  let(:user) { build(:user) }
  let(:group) { build(:group) }

  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:total_amount) }
  it { is_expected.to validate_presence_of(:installments_quantity) }
  it { is_expected.to validate_presence_of(:current_installment) }
  it { is_expected.to validate_presence_of(:due_day) }
  it { is_expected.to validate_presence_of(:group_id) }

  context 'When creating an installment purchase' do
    it 'must be invalid if the group_id is from a not valid user' do
      subject.group_id = 0
      expect(subject).to be_invalid
    end
    it 'must be valid if the owner_id is from valid user' do
      user.save!
      group.owner_id = user.id
      group.save!
      subject.group_id = group.id
      expect(subject).to be_valid
    end
  end
end

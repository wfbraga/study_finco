require 'rails_helper'

RSpec.describe Account, type: :model do
  subject { build(:account) }
  let(:user) { build(:user) }
  let(:group) { build(:group) }

  it { is_expected.to belong_to(:owner) }
  it { is_expected.to belong_to(:group) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:kind) }

  context 'When creating an account' do
    it 'must be invalid if the owner_id is from a not valid user' do
      expect(subject).to be_invalid
    end

    it 'must be valid if the owner_id is from valid user' do
      user.save!
      group.owner = user
      group.save!

      subject.owner_id = user.id
      subject.group_id = group.id

      expect(subject).to be_valid
    end
  end
end

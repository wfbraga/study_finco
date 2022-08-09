require 'rails_helper'

RSpec.describe UserGroup, type: :model do
  subject { build(:user_group) }
  let(:user) { build(:user) }
  let(:group) { build(:group) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:group) }

  context 'When creating a user_group' do
    it 'must be invalid if the user_id is from a not valid user' do
      expect(subject).to be_invalid
    end

    it 'must be valid if the owner_id is from valid user' do
      user.save!

      group.owner_id = user.id

      group.save!

      subject.user_id = user.id
      subject.group_id = group.id

      expect(subject).to be_valid
    end
  end


end

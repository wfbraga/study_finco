# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  subject { build(:group) }
  let(:user) { build(:user) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:owner_id) }
  it { is_expected.to belong_to(:owner) }

  context 'When creating a group' do
    it 'must be invalid if the owner_id is from a not valid user' do
      expect(subject).to be_invalid
    end

    it 'must be valid if the owner_id is from valid user' do
      user.save!
      subject.owner_id = user.id
      expect(subject).to be_valid
    end
  end
end

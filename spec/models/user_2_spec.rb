require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relations' do
  end

  describe 'validations' do
  end

  describe '#active?' do
    let(:user) { build(:user, active: active) }

    context 'when user is active' do
      let(:active) { true }

      it 'returns true' do
        expect(user.active?).to eq(true)
      end
    end

    context 'when user is NOT active' do
      let(:active) { false }

      it 'returns false' do
        expect(user.active?).to eq(false)
      end
    end
  end

  describe '.all_active' do
    let!(:user_active) { build(:user, active: true) }
    let!(:user_inactive) { build(:user, active: false) }

    context 'when user is active' do
      it 'returns the user' do
        expect(described_class.all_active).to include(user_active)
      end
    end

    context 'when user is NOT active' do
      it 'does not return the user' do
        expect(described_class.all_active).to_not include(user_inactive)
      end
    end
  end

  describe '.all_inactive' do
    context 'when user is active' do
      it 'does not return the user' do
      end
    end

    context 'when user is NOT active' do
      it 'returns the user' do
      end
    end
  end

  describe '.by_email' do
    context 'when there is a user with the email' do
      it 'returns the user' do
      end
    end

    context 'when there are users that matches partially with query string' do
      it 'returns all users that match with the query string' do
      end
    end

    context 'when there is NO user with the email' do
      it 'returns nil' do
      end
    end
  end
end

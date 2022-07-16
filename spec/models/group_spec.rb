# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { Group.new }
  let(:user) { User.new(name: 'Base User', email: 'teste@teste.com') }

  context 'When creating a invalid group' do
    it 'Name cannot be nil or empty' do
      group.name = ''
      group.owner_id = 1
      expect(group).to be_invalid
    end
    it 'Owner_id cannot be nil or empty' do
      group.owner_id = nil
      group.name = 'Test Growp'
      expect(group).to be_invalid
    end
    it 'Owner_id must must be from existing user' do
      group.owner_id = 0
      group.name = 'Teste'
      expect(group).to be_invalid
    end
  end

  context 'When creating a valid group' do
    it 'Name must present and owner must be from as existing user' do

      # Saves a User on DB for Group references
      user.save!

      group.name = 'Test Group'

      # Sets the Owner as the created User
      group.owner_id = user.id
      expect(group).to be_valid
    end
  end
end

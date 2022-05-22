require 'rails_helper'

RSpec.describe User, type: :model do
  context 'When creating user' do
    it 'name must be present' do
      user = User.new(name: nil, email: 'teste@teste.com')
      expect(user).to be_invalid
    end

    it 'email must be unique' do
      User.create(name: 'Usuario', email: 'teste@teste.com')
      new_user = User.new(name: 'Tester', email: 'teste@teste.com')

      expect(new_user).to be_invalid
    end
  end
end

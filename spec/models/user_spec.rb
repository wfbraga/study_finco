require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new}
  context 'When creating user' do
    it 'name must be present' do
      user.name = nil
      user.email = 'teste@teste.com'
      expect(user).to be_invalid
    end

    it 'email must be unique' do
      # creates an user on DB
      User.create(name: 'Base User', email: 'teste@teste.com')

      # creates new user with same emails
      new_user = User.new(name: 'Compare User', email: 'teste@teste.com')

      expect(new_user).to be_invalid
    end
  end
end

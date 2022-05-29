require 'rails_helper'

RSpec.describe RecurringBill, type: :model do
  let(:recurring_bills) { RecurringBill.new(
                            description: 'Test description',
                            amount: 100.75,
                            active: :active,
                            due_day: 5,
                            group_id: 1
                          ) }
  context 'When creating a invalid group' do
    it 'description can not be empty.' do
      recurring_bills.description = ''
      expect(recurring_bills).to be_invalid
    end

    it 'amount can not be empty.' do
      recurring_bills.amount = nil
      expect(recurring_bills).to be_invalid
    end

    it 'amount can not be equal or smaller than zero.' do
      recurring_bills.amount = 0
      expect(recurring_bills).to be_invalid
    end

    it 'active can not be empty' do
      recurring_bills.active = nil
      expect(recurring_bills).to be_invalid
    end

    it 'due_day can not be empty' do
      recurring_bills.due_day = nil
      expect(recurring_bills).to be_invalid
    end

    it 'due_day can not be equal or smaller than zero or greater than 31.' do
      recurring_bills.due_day = 0
      expect(recurring_bills).to be_invalid
    end

    it 'groud_id can not be empty' do
      recurring_bills.group_id = nil
      expect(recurring_bills).to be_invalid
    end
  end
end

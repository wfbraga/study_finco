require 'rails_helper'

RSpec.describe InstallmentPurchase, type: :model do
  let(:installment_purchase) { InstallmentPurchase.new(
                            description: 'Teste Instalment Purchase',
                            total_amount: 800.75,
                            installments_quantity: 10,
                            due_day: 5,
                            active: :active,
                            group_id: 1
                            )}

  context 'When creating an invalid installment purchase' do
    it 'description can not be empty' do
      installment_purchase.description = ''
      expect(installment_purchase).to be_invalid
    end

    it 'total amount can not be empity' do
      installment_purchase.total_amount = nil
      expect(installment_purchase).to be_invalid
    end

    it 'installments quantity can no be empity' do
      installment_purchase.installments_quantity = nil
      expect(installment_purchase).to be_invalid
    end

    it 'current installment can not be empity' do
      installment_purchase.current_installment = nil
      expect(installment_purchase).to be_invalid
    end

    it 'due day can not be empity' do
      installment_purchase.due_day = nil
      expect(installment_purchase).to be_invalid
    end

    it 'group_it can not be empity' do
      installment_purchase.group_id = nil
      expect(installment_purchase).to be_invalid
    end
    it 'group_it can not be o a not exintent grou' do
      installment_purchase.group_id = 10
      expect(installment_purchase).to be_invalid
    end
  end
end

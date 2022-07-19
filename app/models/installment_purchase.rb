class InstallmentPurchase < ApplicationRecord
  belongs_to :group
  validates :description, presence: true
  validates :total_amount, presence: true
  validates :installment_amount, presence: true
  validates :installments_quantity, presence: true
  validates :current_installment, presence: true
  validates :due_day, presence: true
  validates :status, presence: true

  enum status: %i[active on_hold deactivated]
end

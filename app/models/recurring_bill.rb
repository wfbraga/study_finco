class RecurringBill < ApplicationRecord
  belongs_to :group
  validates :description, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0.0 }
  validates :active, presence: true
  validates :active, presence: true
  validates :due_day, presence: true, numericality: { greater_than: 0, lower_than: 31 }
  validates :group_id, presence: true
end

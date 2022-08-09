class Operation < ApplicationRecord
  belongs_to :account

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :kind, presence: true

  enum kind: %i[debit credit]
end

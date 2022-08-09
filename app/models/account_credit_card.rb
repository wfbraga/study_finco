class AccountCreditCard < ApplicationRecord
  belongs_to :account
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  validates :bank, presence: true
  validates :brand, presence: true
  validates :credit_limit, numericality: { greater_than: 0}, presence: true
end

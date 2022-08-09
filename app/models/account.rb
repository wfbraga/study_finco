class Account < ApplicationRecord
  belongs_to :group
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  has_many :operations
  has_many :account_credit_cards
  has_many :account_debits
  has_many :account_objectives

  validates :name, presence: true
  validates :kind, presence: true

  enum kind: %i[cash savings cheking_account creditcard investment]
end

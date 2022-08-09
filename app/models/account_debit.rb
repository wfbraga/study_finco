class AccountDebit < ApplicationRecord
  belongs_to :account
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  validates :bank, presence: true
  validates :number, presence: true
end

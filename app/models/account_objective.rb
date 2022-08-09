class AccountObjective < ApplicationRecord
  belongs_to :account
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  validates :target_name, presence: true
  validates :target_amount, numericality: { greater_than: 0 }, presence: true
end

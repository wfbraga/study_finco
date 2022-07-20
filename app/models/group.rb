# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :installment_purchases
  has_many :recurring_bills

  validates :name, presence: true
end

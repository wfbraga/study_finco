# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :installment_purchases
  has_many :recurring_bills

  has_many :user_groups
  has_many :users, through: :user_groups

  validates :name, presence: true
end

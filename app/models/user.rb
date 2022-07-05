class User < ApplicationRecord
  has_many :owned_groups, class_name: 'Group', foreign_key: 'owner_id'
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end

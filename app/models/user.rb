class User < ApplicationRecord
  has_many :owned_groups, class_name: 'Group', foreign_key: 'owner_id'
  
  has_many :user_groups
  has_many :groups, through: :user_groups
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end

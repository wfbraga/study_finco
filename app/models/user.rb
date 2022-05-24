class User < ApplicationRecord
  has_many :groups, class_name: 'group', foreign_key: 'owner_id'
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end

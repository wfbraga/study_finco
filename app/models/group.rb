class Group < ApplicationRecord
  belongs_to :user, foreign_key: 'owner_id'

  validates :name, :owner_id, presence: true
end

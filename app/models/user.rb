class User < ApplicationRecord
  has_many :owned_groups, class_name: 'Group', foreign_key: 'owner_id'
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  scope :all_active, -> { where(active: true) }
  scope :all_inactive, -> { where(active: false) }

  def self.by_email(email)
    where("email LIKE '%?%'", email)
  end

  def active?
    active == true
  end
end

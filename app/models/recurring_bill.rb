class RecurringBill < ApplicationRecord
  belongs_to :group
  validates :description, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0.0 }
  validates :active, presence: true
  validates :active, presence: true # FIXME duplicated line
  validates :due_day, presence: true, numericality: { greater_than: 0, lower_than: 31 }
  validates :group_id, presence: true # FIXME duplicated error messages

  # NOTE The "active" column we put in our db diagram was a boolean column.
  # Since you want more options, I'd suggest to rename this column to "status".
  # So we can have status=active or status=deactivated in the database,
  # instead of active=active and active=deactivated.
  enum active: %i[active on_hold deactivated]
end

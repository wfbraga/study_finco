class AddNullPreventionToRecurringBills < ActiveRecord::Migration[6.0]
  def change
    change_column_null :recurring_bills, :description, false
    change_column_null :recurring_bills, :amount, false
    change_column_null :recurring_bills, :active, false
    change_column_null :recurring_bills, :due_day, false
    change_column_default :recurring_bills, :active, 1
  end
end

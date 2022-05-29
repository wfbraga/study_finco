class CreateRecurringBills < ActiveRecord::Migration[6.0]
  def change
    create_table :recurring_bills do |t|
      t.string :description
      t.decimal :amount, precision: 10, scale: 2
      t.integer :active
      t.integer :due_day
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end

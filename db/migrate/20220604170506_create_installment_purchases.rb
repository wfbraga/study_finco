class CreateInstallmentPurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :installment_purchases do |t|
      t.string :description, null: false
      t.decimal :total_amount, precision: 10, scale: 2, null: false
      t.decimal :installment_amount, precision: 10, scale: 2, null: false
      t.integer :installments_quantity, null: false
      t.integer :current_installment, null: false
      t.integer :due_day, null: false
      t.integer :active, null: false
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end

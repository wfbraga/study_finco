class CreateAccountCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :account_credit_cards do |t|
      t.string :bank, null: false
      t.string :brand, null: false
      t.integer :last_digits
      t.float :credit_limit, precision: 10, scale: 2, null: false, default: 0
      t.string :owner_name
      t.integer :due_day
      t.date :expires_at
      t.references :account, null: false, foreign_key: true
      t.timestamps
    end
    add_reference :account_credit_cards, :owner, foreign_key: { to_table: :users }, null: false
  end
end

class CreateAccountDebits < ActiveRecord::Migration[6.0]
  def change
    create_table :account_debits do |t|
      t.string :bank, null: false
      t.string :branch
      t.string :number, null: false
      t.decimal :credit_limit, precision: 10, scale: 2, null: false, default: 0
      t.string :owner_name
      t.references :account, null: false, foreign_key: true
      t.timestamps
    end
    add_reference :account_debits, :owner, foreign_key: { to_table: :users }, null: false
  end
end

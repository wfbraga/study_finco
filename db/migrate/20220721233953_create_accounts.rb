class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.integer :kind, null: false
      t.references :group, null: false, foreign_key: true
      t.decimal :balance, precision: 10, scale: 2, default: 0, null: false

      t.timestamps
    end
    add_reference :accounts, :owner, foreign_key: { to_table: :users }, null: false
  end
end

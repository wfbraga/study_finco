class CreateAccountObjectives < ActiveRecord::Migration[6.0]
  def change
    create_table :account_objectives do |t|
      t.string :target_name, null: false
      t.float :target_amount, precision: 10, scale: 2, null: false, default: 0
      t.date :acomplish_at
      t.string :owner_name
      t.references :account, null: false, foreign_key: true
      t.timestamps
    end
    add_reference :account_objectives, :owner, foreign_key: { to_table: :users }, null: false
  end
end

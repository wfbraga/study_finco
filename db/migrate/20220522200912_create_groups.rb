class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_reference :groups, :owner, foreign_key: { to_table: :users }, null: false
  end
end

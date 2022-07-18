class ChangeClumnActiveToStatusOnGroups < ActiveRecord::Migration[6.0]
  def change
    change_table :installment_purchases do |t|
      t.rename :active, :status
    end
  end
end

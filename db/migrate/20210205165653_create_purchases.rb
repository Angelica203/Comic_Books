class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.integer :amount_paid
      t.string :num_items
      

      t.timestamps
    end
  end
end

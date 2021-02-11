class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.string :item
      t.integer :number_comics
      t.float :amount_paid
      

      t.timestamps
    end
  end
end

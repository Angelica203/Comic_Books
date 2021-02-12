class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.string :location
      t.float :purchase_total
    
      t.timestamps
    end
  end
end

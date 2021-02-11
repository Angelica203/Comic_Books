class AddComicToPurchases < ActiveRecord::Migration[6.1]
  def change
    add_reference :purchases, :comic, null: false, foreign_key: true
  end
end

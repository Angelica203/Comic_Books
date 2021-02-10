class CreateComics < ActiveRecord::Migration[6.1]
  def change
    create_table :comics do |t|
      t.string :title
      t.string :category
      t.integer :published
      t.float :price
      t.timestamps
    end
  end
end

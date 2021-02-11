class AddUserToComics < ActiveRecord::Migration[6.1]
  def change
    add_reference :comics, :user, null: false, foreign_key: true
  end
end

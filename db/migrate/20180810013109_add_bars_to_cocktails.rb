class AddBarsToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_reference :cocktails, :bar, foreign_key: true
  end
end

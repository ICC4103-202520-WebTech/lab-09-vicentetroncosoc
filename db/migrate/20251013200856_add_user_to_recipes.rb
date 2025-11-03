class AddUserToRecipes < ActiveRecord::Migration[8.0]
  def change
    add_reference :recipes, :user, null: true, foreign_key: true, index: true
  end
end

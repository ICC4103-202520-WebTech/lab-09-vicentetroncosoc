class MakeRecipesUserNotNull < ActiveRecord::Migration[8.0]
  def up
    change_column_null :recipes, :user_id, false
  end

  def down
    change_column_null :recipes, :user_id, true
  end
end

class AddDefaultToLikes < ActiveRecord::Migration[6.0]
  def change
    change_column_default :likes, :counter, 0
  end
end

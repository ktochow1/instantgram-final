class ChangeColumnNullLikes < ActiveRecord::Migration[6.0]
  def change
    change_column_null :likes, :counter, false
  end
end

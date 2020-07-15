class AddDefaultToPostLikes < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:posts, :likes, 0)
  end
end

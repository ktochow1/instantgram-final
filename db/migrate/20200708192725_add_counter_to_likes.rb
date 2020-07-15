class AddCounterToLikes < ActiveRecord::Migration[6.0]
  def change
    add_column :likes, :counter, :integer
  end
end

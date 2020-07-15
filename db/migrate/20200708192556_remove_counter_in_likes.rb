class RemoveCounterInLikes < ActiveRecord::Migration[6.0]
  def change
    remove_column :likes, :counter, :integer
  end
end

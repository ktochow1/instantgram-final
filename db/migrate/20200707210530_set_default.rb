class SetDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :likes, :counter, from: false, to: 0
  end
end

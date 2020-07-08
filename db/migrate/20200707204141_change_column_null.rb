class ChangeColumnNull < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :post_id
      t.integer :counter
    end 
  end
end

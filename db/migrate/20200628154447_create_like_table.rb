class CreateLikeTable < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :counter, default: 0
      t.integer :post_id

    end
  end
end

class CreateGoodsStockItems < ActiveRecord::Migration
  def change
    create_table :goods_stock_items do |t|
      t.integer :goods_stock_id
      t.string :type
      t.integer :user_id
      t.text :memo
      t.integer :quantity

      t.timestamps
    end
  end
end

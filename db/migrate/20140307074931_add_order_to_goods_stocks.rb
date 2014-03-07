class AddOrderToGoodsStocks < ActiveRecord::Migration
  def change
  	add_column :goods_stocks,:order_id,:integer
  	add_column :goods_stocks,:order_item_id,:integer
  end
end

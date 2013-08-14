class GoodsStockItem < ActiveRecord::Base
  attr_accessible :goods_stock_id, :memo, :quantity, :type, :user_id

  belongs_to :goods_stock
end

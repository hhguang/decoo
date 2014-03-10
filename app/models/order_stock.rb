class OrderStock < GoodsStock
  attr_accessible :order_item_id
  belongs_to :order 
  belongs_to :order_item

	def total_of_in
		goods_stock_items.sum :quantity,:conditions=>"act_type='in'"
  	end

  	def total_of_out
  		goods_stock_items.sum :quantity,:conditions=>"act_type='out'"
  	end  
end

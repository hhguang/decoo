class OrderStock < GoodsStock
  attr_accessible :order_item_id
  belongs_to :order 
  belongs_to :order_item
end

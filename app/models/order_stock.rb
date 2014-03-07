class OrderStock < GoodsStock
  # attr_accessible :title, :body
  belongs_to :order 
  belongs_to :order_item
end

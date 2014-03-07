class OrderItem < ActiveRecord::Base
  attr_accessible :box_number, :order_id, :pack, :product_bh, :product_name, :quantity

  belongs_to :order
  has_one :order_item

  
end

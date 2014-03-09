class OrderItem < ActiveRecord::Base
  attr_accessible :box_number, :order_id, :pack, :product_bh, :product_name, :quantity

  belongs_to :order
  has_one :order_stock,:dependent=>:destroy

  after_save :save_order_item
  def save_order_item
  	p={:box_number=>box_number,:goods_category_id=>0,:name=>product_name,:bh=>"#{order.bh}-#{product_bh}"}
  	if order_stock.nil?   		
  		self.order_stock=OrderStock.create!(p)
  		save!
  	else
  		self.order_stock.update_attributes(p)
  	end
  end
end

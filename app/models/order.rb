class Order < ActiveRecord::Base
  attr_accessible :bh, :company, :mark, :total,:order_items_attributes,:memo

  has_many :order_items,:dependent=>:destroy
  has_many :order_stocks,:through=>:order_items

  validates :bh,:presence => true, :uniqueness => true

  accepts_nested_attributes_for :order_items,:reject_if => lambda { |a| a[:product_bh].blank? || a[:quantity].blank?  }, :allow_destroy => true

  def total
  	order_items.sum :quantity
  end

  def total_of_in
  	order_stocks.sum {|order_stock| order_stock.total_of_in}
  end

  def total_of_out
  	order_stocks.sum {|order_stock| order_stock.total_of_out}
  end
  
  def out
  	order_stocks.each do |order_stock|
  		GoodsStockItem.transaction do 
  			item=GoodsStockItem.new(:goods_stock_id=>order_stock.id,:act_type=>"out",:store_house_id=>StoreHouse.default.id,:quantity=>order_stock.quantity)
	  		item.save!
	  		HouseStock.out(item)
	  		GoodsStock.out(item)
	  	end
  	end
  end
end

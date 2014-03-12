# encoding: utf-8
class GoodsStockItem < ActiveRecord::Base
  attr_accessible :goods_stock_id, :memo, :quantity, :act_type, :user_id,:store_house_id

  validates :store_house_id,:presence=>true

  validates	:quantity,:numericality=>{:greater_than_or_equal_to=>0} 

  validate :out_check

  validate :check_order,:if=>Proc.new { |a| a.goods_stock.class==OrderStock  }

  belongs_to :goods_stock
  belongs_to :store_house
  belongs_to :user

  after_save :check_order_completed

  def check_order_completed
    if (self.goods_stock.class== OrderStock) &  (act_type=="out")
      order=OrderStock.find(goods_stock_id).order_item.order
      if order.total==order.total_of_out
        order.update_attributes!(:completed=>true)
      else
        order.update_attributes!(:completed=>false)
      end
    end
  end

  def self.in(item)
  	GoodsStockItem.transaction do 
  		item.save!
  		HouseStock.in(item)
  		GoodsStock.in(item)
  	end
  end

  def self.out(item)
  	GoodsStockItem.transaction do 
  		item.save!
  		HouseStock.out(item)
  		GoodsStock.out(item)
  	end
  end


	private

	def out_check
		if act_type=="out"
			housestock=HouseStock.where(:goods_stock_id=>goods_stock_id,:store_house_id=>store_house_id).first
			goods_stock=GoodsStock.where(:id=>goods_stock_id).first

			if housestock.nil? || goods_stock.nil?
				errors[:goods_stock_id]<<"库存中没有这种货物"	  
		    elsif goods_stock.quantity-quantity<0 || housestock.quantity-quantity<0
		        errors[:quantity] << "库存不足"	    
		  	end
	  	end
	end

  def check_order
    if act_type=="in"
      order_stock=OrderStock.find(goods_stock_id)
      errors[:quantity] << "超过订单件数" if order_stock.total_of_in+quantity > order_stock.order_item.quantity
    end
  end

end

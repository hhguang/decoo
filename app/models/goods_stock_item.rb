# encoding: utf-8
class GoodsStockItem < ActiveRecord::Base
  attr_accessible :goods_stock_id, :memo, :quantity, :act_type, :user_id,:store_house_id

  validates :store_house_id,:presence=>true

  validates	:quantity,:numericality=>{:greater_than_or_equal_to=>0} 

  validate :out_check


  belongs_to :goods_stock
  belongs_to :store_house

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

end

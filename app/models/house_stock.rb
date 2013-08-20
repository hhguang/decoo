class HouseStock < ActiveRecord::Base
  attr_accessible :goods_stock_id, :quantity, :store_house_id

  belongs_to :store_house
  belongs_to :goods_stock

  validates	:quantity,:numericality=>{:greater_than_or_equal_to=>0} 

  def self.in(item)
  	housestock=self.find_or_initialize_by_goods_stock_id_and_store_house_id(item.goods_stock_id,item.store_house_id)
  	housestock.quantity+=item.quantity
  	housestock.store_house_id=item.store_house_id
  	housestock.save!
  end

  def self.out(item)
  	housestock=self.find_or_initialize_by_goods_stock_id_and_store_house_id(item.goods_stock_id,item.store_house_id)
  	housestock.quantity-=item.quantity
  	housestock.store_house_id=item.store_house_id
  	housestock.save!
  end

end

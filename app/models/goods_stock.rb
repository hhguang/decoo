class GoodsStock < ActiveRecord::Base
  attr_accessible :bh, :memo, :name, :quantity,:goods_category_id,:supplier,:box_number

  validates :bh,:presence => true, :uniqueness => true
  validates	:goods_category_id,:presence=>true
  validates	:quantity,:numericality=>{:greater_than_or_equal_to=>0} 

  has_many :goods_stock_items,:dependent=>:destroy
  has_many	:house_stocks,:dependent=>:destroy
  belongs_to :goods_category
  belongs_to	:store_house

  scope :lower_limit,joins(:goods_category).where('quantity< "goods_categories"."limit" ')

  

  def self.in(item)
  	goods_stock=GoodsStock.find_or_initialize_by_id(item.goods_stock_id)
  	goods_stock.quantity+=item.quantity
  	goods_stock.save!
  end

  def self.out(item)
  	goods_stock=GoodsStock.find_or_initialize_by_id(item.goods_stock_id)
  	goods_stock.quantity-=item.quantity
  	goods_stock.save!
  end

end

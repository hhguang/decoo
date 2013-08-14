class GoodsStock < ActiveRecord::Base
  attr_accessible :bh, :memo, :name, :quantity,:goods_category_id

  validates :bh,:name,:presence => true, :uniqueness => true
  validates	:goods_category_id,:presence=>true
  validates	:quantity,:numericality=>{:greater_than_or_equal_to=>0} 

  has_many :goods_stock_items
  belongs_to :goods_category
  belongs_to	:store_house
end

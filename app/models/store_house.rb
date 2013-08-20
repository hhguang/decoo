class StoreHouse < ActiveRecord::Base
  attr_accessible :name

  has_many	:goods_stocks
  has_many	:goods_stocks_items
end

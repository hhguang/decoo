class StoreHouse < ActiveRecord::Base
  attr_accessible :name

  has_many	:goods_stocks
end

class HouseStock < ActiveRecord::Base
  attr_accessible :goods_stock_id, :quantity, :store_house_id
end

class StoreHouse < ActiveRecord::Base
  attr_accessible :name,:default

  has_many	:house_stocks
  has_many	:goods_stocks_items

  def self.default
  	where(:default=>true).first || first
  end

  after_save :change_default
  def change_default
     if self.default?
       StoreHouse.where(["id <> ?",self.id]).update_all(:default=>false)
     end
  end
end

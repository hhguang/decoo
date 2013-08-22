# encoding: utf-8
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

  after_destroy :check_count
  def check_count
    if StoreHouse.count.zero?
      raise "不能删除最后一个仓库"
    end
    if house_stocks.any?
      raise "仓库中已存放有货物,不能删除"
    end
  end
end

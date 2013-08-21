# encoding: utf-8
class AddDefaultToStoreHouse < ActiveRecord::Migration
  def change
    add_column :store_houses, :default, :boolean,:default=>false
    add_column :goods_stocks, :supplier,:string
    
  end
end

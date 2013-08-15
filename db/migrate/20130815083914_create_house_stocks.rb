class CreateHouseStocks < ActiveRecord::Migration
  def change
    create_table :house_stocks do |t|
      t.integer :goods_stock_id,:null=>false
      t.integer :store_house_id,:null=>false
      t.integer :quantity,:default=>0

      t.timestamps
    end
  end
end

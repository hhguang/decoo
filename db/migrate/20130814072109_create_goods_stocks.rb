class CreateGoodsStocks < ActiveRecord::Migration
  def change
    create_table :goods_stocks do |t|
      t.string :name,:null=>false
      t.integer :quantity,:default=>0
      t.string :bh,:null=>false
      t.text :memo
      t.integer	:store_house_id
      t.integer	:goods_category_id

      t.timestamps
    end
  end
end

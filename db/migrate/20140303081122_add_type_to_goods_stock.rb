class AddTypeToGoodsStock < ActiveRecord::Migration
  def change
  	add_column :goods_stocks,:type,:string
  end
end

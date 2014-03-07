class AddTypeToGoodsStock < ActiveRecord::Migration
  def change
  	add_column :goods_stocks,:type,:string
  	# add_column :goods_stocks,:package_number,:integer
  	add_column :goods_stocks,:box_number,:integer
  end
end

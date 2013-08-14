class GoodsCategory < ActiveRecord::Base
  attr_accessible :limit, :name, :parent_id
  belongs_to 	:parent,
  				:class_name=>"GoodsCategory"
  has_many		:children,
  				:class_name=>"GoodsCategory" ,
  				:foreign_key=>"parent_id",
  				:dependent=>:destroy

  has_many  :goods_stocks

	def self.roots
		where("parent_id is null")
	end  				

	
end

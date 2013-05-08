class Part < ActiveRecord::Base
  attr_accessible :package_id, :quantity, :spec_id, :toy_id,:parent_id

  belongs_to :package
  belongs_to :spec
  belongs_to 	:parent,
  				:class_name=>"Part"
  has_many		:children,
  				:class_name=>"Part" ,
  				:foreign_key=>"parent_id",
  				:dependent=>:destroy


  def is_small_package?
  	self.parent_id.nil? && self.chirldren.size>0
  end

  
end

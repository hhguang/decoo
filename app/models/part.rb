# encoding: utf-8
class Part < ActiveRecord::Base
  attr_accessible :package_id, :quantity, :spec_id, :toy_id,:parent_id,:spec_bh

  belongs_to :package
  belongs_to :spec
  belongs_to 	:parent,
  				:class_name=>"Part"
  has_many		:children,
  				:class_name=>"Part" ,
  				:foreign_key=>"parent_id",
  				:dependent=>:destroy

  validates_presence_of :spec_id

  def spec_bh=(bh_field)          
    self.spec_id=Spec.find_by_bh!(bh_field).id
    rescue ActiveRecord::RecordNotFound
      errors[:spec_bh]="编号不存在"

    
  end

  def spec_bh
    self.spec.bh if self.spec
  end

  def is_small_package?
  	self.parent_id.nil? && self.chirldren.size>0
  end

  
end

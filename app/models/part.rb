# encoding: utf-8
class Part < ActiveRecord::Base
  attr_accessible :package_id, :quantity, :spec_id, :toy_id,:parent_id,:spec_bh,:small_package_name,:children_attributes

  belongs_to :package
  belongs_to :spec  

  validates_presence_of :spec_id

  def spec_bh=(bh_field)          
    self.spec_id=Spec.find_by_bh!(bh_field.strip).id
    rescue ActiveRecord::RecordNotFound
      errors[:spec_bh]="编号不存在"
    
  end

  def spec_bh
    self.spec.bh if self.spec
  end 

  
  
end

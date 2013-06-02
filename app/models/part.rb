# encoding: utf-8
class Part < ActiveRecord::Base
  attr_accessible :package_id, :quantity, :spec_id, :toy_id,:parent_id,:spec_bh,:small_package_name,:children_attributes

  belongs_to :package
  belongs_to :spec  
  has_many   :porder_items

  validates_presence_of :spec_id
  validates :quantity,:presence => true
  validates :quantity,:numericality=>{:greater_than=>0}
  validates_uniqueness_of :spec_id, :scope =>:package_id


  def spec_bh=(bh_field)          
    self.spec_id=Spec.find_by_bh!(bh_field.strip).id
    rescue ActiveRecord::RecordNotFound
      errors[:spec_bh]="编号不存在"
    
  end

  def spec_bh
    self.spec.bh if self.spec
  end 

  def count_in_toy
    self.package.parent ? self.package.parent.quantity*self.package.quantity*self.quantity : self.package.quantity*self.quantity
  end

  
  
end

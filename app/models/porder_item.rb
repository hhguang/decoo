# encoding: utf-8
class PorderItem < ActiveRecord::Base
  attr_accessible :part_id, :quantity,:spec_id,:spec_bh
  belongs_to :porder
  belongs_to :part,:include=>:spec
  belongs_to :spec

  validates :spec_id,:presence => {:message=>"零件不存在"},:if=>Proc.new{|p| p.part_id.nil?}

  validates :quantity,:numericality=>{:greater_than=>0}

  def spec_bh=(spec_bh_field)
    spec=Spec.find_by_bh!(spec_bh_field.strip)
  	self.spec_id=spec.id
    rescue ActiveRecord::RecordNotFound
      self.errors.add  :base,"编号不存在"
      
  end

  def spec_bh
  	Spec.find(self.spec_id).bh if spec_id
  end
  
end

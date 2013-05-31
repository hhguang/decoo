class Package < ActiveRecord::Base
  attr_accessible :name, :toy_id,:parts_attributes,:children_attributes,:quantity

  validates :name,:quantity,:presence => true
  validates :quantity,:numericality=>{:greater_than=>0}

  belongs_to :toy
  has_many :parts,:dependent=>:destroy
  has_many :specs,:through=>:parts
  belongs_to 	:parent,
  				:class_name=>"Package"
  has_many		:children,
  				:class_name=>"Package" ,
  				:foreign_key=>"parent_id",
  				:dependent=>:destroy
  accepts_nested_attributes_for :parts,:reject_if => lambda { |a| a[:spec_bh].blank? && a[:spec_id].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :children, :reject_if => lambda { |a| a[:name].blank? },:allow_destroy => true

  def count_for_part
    self.parts.sum{|part| part.count_in_toy } 
  end
end

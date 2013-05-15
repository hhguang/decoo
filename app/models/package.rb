class Package < ActiveRecord::Base
  attr_accessible :name, :toy_id,:parts_attributes,:children_attributes,:quantity

  belongs_to :toy
  has_many :parts
  has_many :specs,:through=>:parts
  belongs_to 	:parent,
  				:class_name=>"Package"
  has_many		:children,
  				:class_name=>"Package" ,
  				:foreign_key=>"parent_id",
  				:dependent=>:destroy
  accepts_nested_attributes_for :parts,:reject_if => lambda { |a| a[:spec_id].blank? }
  accepts_nested_attributes_for :children
end

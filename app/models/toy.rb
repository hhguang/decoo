class Toy < ActiveRecord::Base
  attr_accessible :name,:packages_attributes

  has_many :packages
  has_many :porders
  accepts_nested_attributes_for :packages,:reject_if => lambda { |a| a[:name].blank? }

  def parts
  	
  	packages_ids=[]

  	packages_ids<<self.packages.map{|p| p.id }
  	self.packages.each{|package| packages_ids<<package.children.map{|p| p.id } } 
  	Part.find_all_by_package_id(packages_ids)
  end
end

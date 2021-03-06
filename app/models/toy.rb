class Toy < ActiveRecord::Base
  attr_accessible :name,:packages_attributes,:photo, :photo_cache,:title

  validates_presence_of :name

  has_many :packages
  has_many :porders
  accepts_nested_attributes_for :packages,:reject_if => lambda { |a| a[:name].blank? },:allow_destroy => true

  mount_uploader :photo, PhotoUploader

  def parts
  	
  	packages_ids=[]

  	packages_ids<<self.packages.map{|p| p.id }
  	self.packages.each{|package| packages_ids<<package.children.map{|p| p.id } } 
  	# Part.find_all_by_package_id(packages_ids)
    Part.where(:package_id=>packages_ids).order("package_id")
  end

  def count_for_part
    self.parts.sum{|part| part.count_in_toy }
  end
end

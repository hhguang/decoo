# encoding: utf-8
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

  validate :validate_unique_parts

  def validate_unique_parts
    
    validate_uniqueness_of_in_memory(
      parts, [:spec_bh], '零件包中零件重复')
  end


  def count_for_part
    self.parts.sum{|part| part.count_in_toy } 
  end

  def all_parts
    packages_ids=[self.id]
    packages_ids<<self.children.map{|p| p.id } 
    Part.find_all_by_package_id(packages_ids)
  end

end

module ActiveRecord
  class Base
    # Validate that the the objects in +collection+ are unique
    # when compared against all their non-blank +attrs+. If not
    # add +message+ to the base errors.
    def validate_uniqueness_of_in_memory(collection, attrs, message)
      hashes = collection.inject({}) do |hash, record|
        key = attrs.map {|a| record.send(a).to_s }.join
        if key.blank? || record.marked_for_destruction?
          key = record.object_id
        end
        hash[key] = record unless hash[key]
        hash
      end
      if collection.length > hashes.length
        self.errors.add  :base, message
      end
    end
  end
end

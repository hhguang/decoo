class Package < ActiveRecord::Base
  attr_accessible :name, :toy_id,:parts_attributes

  belongs_to :toy
  has_many :parts
  has_many :specs,:through=>:parts
  accepts_nested_attributes_for :parts,:reject_if => lambda { |a| a[:spec_id].blank? }
end

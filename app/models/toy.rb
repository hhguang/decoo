class Toy < ActiveRecord::Base
  attr_accessible :name,:packages_attributes

  has_many :packages
  accepts_nested_attributes_for :packages
end

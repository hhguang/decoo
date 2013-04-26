class Role < ActiveRecord::Base
  attr_accessible :name,:title

  has_many :assignments
  has_many :users, :through => :assignments
end

class MList < ActiveRecord::Base
  attr_accessible :name
  has_many :m_items,:dependent=>:destroy
end

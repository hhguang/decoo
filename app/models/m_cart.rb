class MCart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :m_items,:dependent=>:destroy
end

class PorderItem < ActiveRecord::Base
  attr_accessible :part_id, :quantity
  belongs_to :porder
  belongs_to :part,:include=>:spec

  
end

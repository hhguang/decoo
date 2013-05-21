class Porder < ActiveRecord::Base
  attr_accessible :name, :outstock_id, :quantity, :toy_id, :user_id
end

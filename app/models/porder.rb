class Porder < ActiveRecord::Base
  attr_accessible :name, :outstock_id, :quantity, :toy_id, :user_id

  belongs_to :toy
  belongs_to :user

  validates :quantity,:presence => true,
                    :numericality=>{:greater_than=>0}

end

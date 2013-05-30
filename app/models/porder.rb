class Porder < ActiveRecord::Base
  attr_accessible :name, :outstock_id, :quantity, :toy_id, :user_id

  belongs_to :toy
  belongs_to :user
  has_many 	 :porder_items

  accepts_nested_attributes_for :porder_items,:reject_if => lambda { |a| a[:part_id].blank? },:allow_destroy => true

  validates :quantity,:presence => true,
                    :numericality=>{:greater_than=>0}


end

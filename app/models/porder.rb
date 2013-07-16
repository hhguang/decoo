class Porder < ActiveRecord::Base
  attr_accessible :name, :outstock_id, :quantity, :toy_id, :user_id,:is_out,:porder_items_attributes

  belongs_to :toy
  belongs_to :user
  has_many 	 :porder_items,:dependent=>:destroy
  has_one	 :outstock

  scope :wait_for_out,where(:is_out=>false ).includes(:porder_items)

  accepts_nested_attributes_for :porder_items,:reject_if => lambda { |a| a[:part_id].blank? },:allow_destroy => true

  validates :quantity,:presence => true,
                    :numericality=>{:greater_than=>0}


   def self.wait_for_out_items
   	hash={}
   	arr=[]
   	self.wait_for_out.each do |list|
   		arr<<list.porder_items
   	end
   	return arr
   end

end

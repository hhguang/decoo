class Outstock < ActiveRecord::Base
  attr_accessible :memo, :taker, :user_id,:outstock_items_attributes,:porder_id

  has_many :outstock_items, :dependent => :destroy
  belongs_to :user
  belongs_to :porder,
  			 :conditions=>"porder_id is not null"
  accepts_nested_attributes_for :outstock_items

  before_create :add_bh
  def add_bh
    self.bh=Time.now.strftime("%Y%m%d%H%M%S ")
  end
end

class Outstock < ActiveRecord::Base
  attr_accessible :memo, :taker, :user_id,:outstock_items_attributes

  has_many :outstock_items, :dependent => :destroy
  accepts_nested_attributes_for :outstock_items

  before_create :add_bh
  def add_bh
    self.bh=Time.now.strftime("%Y%m%d%H%M%S ")
  end
end

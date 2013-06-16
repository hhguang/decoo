class Outstock < ActiveRecord::Base
  attr_accessible :memo, :taker, :user_id,:outstock_items_attributes,:porder_id

  has_many :outstock_items, :dependent => :destroy
  belongs_to :user
  belongs_to :porder
  accepts_nested_attributes_for :outstock_items

  before_create :add_bh
  after_save :set_from_porder
  def add_bh
    self.bh=Time.now.strftime("%Y%m%d%H%M%S ")
  end

  def set_from_porder
    porder.update_attributes!(:is_out=>true) if porder
  end


end

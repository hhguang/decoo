class Order < ActiveRecord::Base
  attr_accessible :bh, :company, :mark, :total,:order_items_attributes

  has_many :order_items
  has_many :order_stocks

  accepts_nested_attributes_for :order_items,:reject_if => lambda { |a| a[:bh].blank? || a[:quantity].blank?  }
end

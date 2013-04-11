# encoding: utf-8
class InStockItem < ActiveRecord::Base
  attr_accessible :in_stock_id, :product_id,:color_id,:weight,:quantity,:spec_bh,:spec_id,:memo
  belongs_to :in_stock
  belongs_to :product
  belongs_to :color
  belongs_to :spec

  validates :spec_bh,:weight,:presence => true
  validates :weight,:numericality=>{:greater_than=>0}

  validate :find_spec,:check_weight
  def find_spec
    unless Spec.find_by_bh(spec_bh)
      errors[:spec_bh]="货号不存在"
    else
      product=Spec.find_by_bh(spec_bh).product
      unless product.weight
        errors[:spec_bh]="零件编号#{spec_bh}未录入单位重量"
      else
        errors[:weight]="不能小于该零件(编号：#{spec_bh})单位重量" if weight<product.weight
      end
    end
  end

  def check_weight
    
  end

#  def spec_bh=(spec_bh_field)
#
#
#
#  end
#
#  def spec_bh
#    self.spec.bh
#  end

  before_save :save_quantity
  def save_quantity
    spec=Spec.find_by_bh(self.spec_bh)
    self.spec_id=spec.id
    self.product_id=spec.product_id
    self.color_id=spec.color_id
    self.quantity=(self.weight/self.product.weight).round
  end
end

# encoding: utf-8
class OutstockItem < ActiveRecord::Base
  attr_accessible :outstock_id, :product_id, :spec_bh, :spec_id,:weight,:quantity

  belongs_to :outstock
  belongs_to :spec

  validates :spec_bh,:presence => true
  validates :weight,:presence => true,
                    :numericality=>{:greater_than=>0}


#  def spec_bh=(spec_bh_field)
#    self.spec_bh=spec_bh_field
#    if spec=Spec.find_by_bh(spec_bh_field)
#      self.spec_id=spec.id
#      if stock=Stock.find_by_spec_id(spec.id)
#
#      else
#        errors.add(:base,"库存中没有这种规格的零件")
#        return false
#      end
#    else
#      errors.add(:base,"没有这种规格的零件")
#      return false
#    end
#  end

 after_validation :set_item

  def set_item
    if spec=Spec.find_by_bh(self.spec_bh)
      self.spec_id=spec.id
      self.product_id=spec.product_id

      if self.weight && spec.product.weight  && spec.product.weight>0
        if self.weight<spec.product.weight
          errors.add(:weight,"出库重量小于该零件的单位重量")
          return false
        else
          self.quantity=(self.weight/spec.product.weight).round if self.weight
          if stock=Stock.find_by_spec_id(spec.id)
            if stock.quantity<self.quantity
              errors.add(:weight,"库存不足")
              return false
            end
          else
            errors.add(:bh,"库存中没有这种规格的零件")
            return false
          end
        end
        
        
      else
        errors.add(:base,"未输入出库零件重量或者零件未设置单位重量")
        return false
      end
      
      return true
    else
      errors.add(:bh,"没有这种规格的零件")
      return false
    end
  end


end

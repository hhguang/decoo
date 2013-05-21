# encoding: utf-8
class Spec < ActiveRecord::Base
  attr_accessible :bh, :color_id, :product_id, :material,:name,:color_bh,:memo

  validates :color_id,:product_id,:presence=>{:message=>"编号不存在"}
  validates_uniqueness_of :color_id, :scope => :product_id
  
  @@color_exist=true
  belongs_to :product
  belongs_to :color
  has_one :stock,:dependent=>:destroy
  has_many :in_stock_items,:dependent=>:destroy
  has_many :outstock_items,:dependent=>:destroy
  has_many :parts
  has_many :packages,:through=>:parts
    
  
  validate :bh_exist?
  def bh_exist?    
    unless @@color_exist
      errors[:color_id]="没有这种颜色"
    end
  end
  
  #颜色编号验证有问题，需要进一步处理
  def color_bh=(color_bh_field)
    
    color=Color.find_by_bh!(color_bh_field)
    self.color_id=color.id
    @@color_exist=true
  rescue ActiveRecord::RecordNotFound
    @@color_exist=false
    errors[:color_bh]="颜色编号#{color_bh_field}不存在"
    #是否可以用raise 抛出异常 
  end

  def color_bh
    Color.find(self.color_id).bh
  end

  before_save :set_bh
  def set_bh
    self.bh="#{self.product.bh}-#{self.color.bh}"
  end

  after_save :change_stock
  def change_stock
     if self.stock
       self.stock.add_item
       self.stock.save
     end
  end

#  before_destroy :check_stock
#  def check_stock
#    if self.stock
#      raise "规格编号为#{self.bh}的零件已加入库存，如要删除请管理员清除此规格零件的库存"
#    end
#  end


  def material_to_array
    self.material.split(/[\,]/) if self.material
  end


  
end

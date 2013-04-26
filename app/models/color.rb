#encoding: utf-8
class Color < ActiveRecord::Base
  attr_accessible :bh, :name, :value,:memo

  has_many :specs

  validates :bh,:presence => true, :uniqueness => true

  after_save :change_spec
  def change_spec
    self.specs.each do |spec|
      spec.save!
    end
  end

  before_destroy :check_specs
  def check_specs
    if self.specs.size>0
      raise "编号为#{self.bh}的颜色已被多种规格使用，不能删除"
    end
  end
  
end

# encoding: utf-8
class Sets < ActiveRecord::Base
  attr_accessible :key, :title, :value

  def self.stock_lower_warning
  	where(:key=>'StockLowerWarning').first || create(:key=>"StockLowerWarning",:title=>"零件库存预警下限",:value=>'0')
  end
end

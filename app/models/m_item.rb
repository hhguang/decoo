class MItem < ActiveRecord::Base
   attr_accessible :m_cart_id,:m_list_id,:toy_id,:quantity
  belongs_to :m_list
  belongs_to :toy
  belongs_to :m_cart
end

class Role < ActiveRecord::Base
  attr_accessible :name,:title,:permission_ids

  has_many :assignments
  has_many :users, :through => :assignments
  has_and_belongs_to_many :permissions
  accepts_nested_attributes_for :permissions,:reject_if => lambda { |a| a[:permission_id].blank? }, :allow_destroy => true
end

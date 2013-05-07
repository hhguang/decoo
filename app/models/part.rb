class Part < ActiveRecord::Base
  attr_accessible :package_id, :quantity, :spec_id, :toy_id

  belongs_to :package
  belongs_to :spec
end

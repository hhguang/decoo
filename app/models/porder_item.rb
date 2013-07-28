class PorderItem < ActiveRecord::Base
  attr_accessible :part_id, :quantity,:spec_id,:spec_bh
  belongs_to :porder
  belongs_to :part,:include=>:spec
  belongs_to :spec

  def spec_bh=(spec_bh_field)
  	if spec=Spec.find_by_bh(spec_bh_field)
  		self.spec_id=spec.id
  	end
  end

  def spec_bh
  	Spec.find(self.spec_id).spec_bh if spec_id
  end
  
end

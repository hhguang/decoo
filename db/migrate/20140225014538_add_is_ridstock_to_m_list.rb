class AddIsRidstockToMList < ActiveRecord::Migration
  def change
  	add_column :m_lists,:is_ridstock,:boolean,:default=>true
  end
end

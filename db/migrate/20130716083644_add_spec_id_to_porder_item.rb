class AddSpecIdToPorderItem < ActiveRecord::Migration
  def change
    add_column :porder_items, :spec_id, :integer    
  end
end

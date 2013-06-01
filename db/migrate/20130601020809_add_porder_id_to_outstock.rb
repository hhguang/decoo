class AddPorderIdToOutstock < ActiveRecord::Migration
  def change
    add_column :outstocks, :porder_id, :integer
  end
end

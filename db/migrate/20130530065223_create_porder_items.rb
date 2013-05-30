class CreatePorderItems < ActiveRecord::Migration
  def change
    create_table :porder_items do |t|
      t.integer :part_id
      t.integer :quantity
      t.integer	:porder_id

      t.timestamps
    end
  end
end

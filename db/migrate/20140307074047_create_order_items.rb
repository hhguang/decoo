class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.string :product_bh
      t.string :product_name
      t.string :pack
      t.integer :box_number
      t.integer :quantity

      t.timestamps
    end
  end
end

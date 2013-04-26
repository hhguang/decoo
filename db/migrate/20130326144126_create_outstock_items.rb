class CreateOutstockItems < ActiveRecord::Migration
  def change
    create_table :outstock_items do |t|
      t.string :spec_bh
      t.integer :spec_id
      t.integer :product_id
      t.integer :outstock_id
      t.decimal :weight
      t.integer :quantity
      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :bh
      t.string :company
      t.string :mark
      t.integer :total
      t.text	:memo

      t.timestamps
    end
  end
end

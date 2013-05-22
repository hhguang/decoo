class CreatePorders < ActiveRecord::Migration
  def change
    create_table :porders do |t|
      t.string :name
      t.integer :toy_id
      t.integer :quantity
      t.integer :user_id
      t.integer :outstock_id
      t.text    :memo

      t.timestamps
    end
  end
end

class AddMemoToStockItems < ActiveRecord::Migration
  def change
    add_column :in_stock_items,:memo,:text
    add_column :in_stock_items,:spec_id,:integer
    add_column :in_stock_items,:user_id,:integer
    add_column :in_stock_items,:spec_bh,:string
    add_column :stocks,         :spec_id,:integer
    rename_column :stocks,      :color,:color_name
  end
end

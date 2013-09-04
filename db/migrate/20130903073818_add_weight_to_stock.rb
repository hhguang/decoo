class AddWeightToStock < ActiveRecord::Migration
  def change
    add_column :stocks, :weight, :decimal,:default=>0
  end
end

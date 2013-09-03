class AddWeightToStock < ActiveRecord::Migration
  def change
    add_column :stocks, :weight, :decimal
  end
end

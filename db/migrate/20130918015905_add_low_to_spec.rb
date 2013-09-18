class AddLowToSpec < ActiveRecord::Migration
  def change
    add_column :specs, :low, :decimal
  end
end

class AddXqsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :xqs, :integer
  end
end

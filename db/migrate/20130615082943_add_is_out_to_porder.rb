class AddIsOutToPorder < ActiveRecord::Migration
  def change
    add_column :porders, :is_out, :boolean,:default=>false
  end
end

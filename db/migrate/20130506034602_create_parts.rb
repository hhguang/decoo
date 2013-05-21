class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.integer :package_id
      t.integer :toy_id
      t.integer :spec_id
      t.integer :quantity
      

      t.timestamps
    end
  end
end

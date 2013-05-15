class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name
      t.integer :toy_id
      t.integer	:quantity
      t.integer :parent_id

      t.timestamps
    end
  end
end

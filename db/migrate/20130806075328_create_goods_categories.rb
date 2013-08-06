class CreateGoodsCategories < ActiveRecord::Migration
  def change
    create_table :goods_categories do |t|
      t.string :name
      t.integer :parent_id
      t.integer :limit,:default=>0

      t.timestamps
    end
  end
end

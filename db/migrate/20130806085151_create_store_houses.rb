class CreateStoreHouses < ActiveRecord::Migration
  def change
    create_table :store_houses do |t|
      t.string :name

      t.timestamps
    end
  end
end

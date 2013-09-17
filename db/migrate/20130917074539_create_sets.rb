class CreateSets < ActiveRecord::Migration
  def change
    create_table :sets do |t|
      t.string :key
      t.string :value
      t.string :title

      t.timestamps
    end
  end
end

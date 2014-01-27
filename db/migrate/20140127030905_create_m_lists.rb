class CreateMLists < ActiveRecord::Migration
  def change
    create_table :m_lists do |t|
    	t.string :name
      t.timestamps
    end
  end
end

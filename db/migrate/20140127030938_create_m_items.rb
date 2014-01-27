class CreateMItems < ActiveRecord::Migration
  def change
    create_table :m_items do |t|
    	t.integer :m_list_id
    	t.integer :toy_id
    	t.integer :quantity
    	t.integer :m_cart_id
      	t.timestamps
    end
  end
end

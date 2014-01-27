class CreateMCarts < ActiveRecord::Migration
  def change
    create_table :m_carts do |t|

      t.timestamps
    end
  end
end

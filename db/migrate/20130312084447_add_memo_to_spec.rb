class AddMemoToSpec < ActiveRecord::Migration
  def change
    add_column :specs,:memo,:text
    add_column :colors,:memo,:text
  end
end

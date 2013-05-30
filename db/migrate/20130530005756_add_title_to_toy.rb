class AddTitleToToy < ActiveRecord::Migration
  def change
    add_column :toys, :title, :string
  end
end

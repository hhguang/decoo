class CreateUserLogs < ActiveRecord::Migration
  def change
    create_table :user_logs do |t|
      t.integer :user_id
      t.string :ctr_name
      t.string :action_name
      t.integer :resource_id
      t.string :resource_name
      t.text :description
      t.string :remote_ip
      t.string :url

      t.timestamps
    end
  end
end

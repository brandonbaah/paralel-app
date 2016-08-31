class CreateCheckLists < ActiveRecord::Migration
  def change
    create_table :check_lists do |t|
      t.string :goal
      t.integer :client_id
      t.integer :user_id
      t.boolean :status

      t.timestamps null: false
    end
  end
end

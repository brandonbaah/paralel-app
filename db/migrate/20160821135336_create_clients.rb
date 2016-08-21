class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :birthdate
      t.string :address
      t.integer :phone
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

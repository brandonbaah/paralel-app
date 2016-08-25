class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :event
      t.integer :recordable_id
      t.string :recordable_type

      t.timestamps null: false
    end
  end
end

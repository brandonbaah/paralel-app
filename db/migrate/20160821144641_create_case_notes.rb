class CreateCaseNotes < ActiveRecord::Migration
  def change
    create_table :case_notes do |t|
      t.integer :client_id
      t.datetime :date
      t.text :note

      t.timestamps null: false
    end
  end
end

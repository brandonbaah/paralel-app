class AddAdmintoUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :manager_id, :integer
    add_column :users, :director_id, :integer
  end
end

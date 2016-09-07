class ChangeManagerIdToSupervisorId < ActiveRecord::Migration
  def change
    remove_column :users, :manager_id, :integer
    add_column :users, :supervisor_id, :integer
  end
end

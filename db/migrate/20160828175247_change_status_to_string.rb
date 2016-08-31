class ChangeStatusToString < ActiveRecord::Migration
  def change
    remove_column :check_lists, :status, :boolean
    add_column :check_lists, :status, :string
  end
end

class ChangeStatusToComplete < ActiveRecord::Migration
  def change
    remove_column :check_lists, :status, :string
    add_column :check_lists, :complete, :boolean
  end
end

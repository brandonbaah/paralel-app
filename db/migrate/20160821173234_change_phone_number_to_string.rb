class ChangePhoneNumberToString < ActiveRecord::Migration
  def change
    remove_column :clients, :phone, :integer
    add_column :clients, :phone, :string
  end
end

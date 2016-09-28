class AddImageToClientsAndUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :image, :string
    add_column :users, :image, :string
  end
end

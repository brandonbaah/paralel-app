class AddDescriptionToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :description, :string
  end
end

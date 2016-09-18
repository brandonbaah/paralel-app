class AddCoordinatesToClient < ActiveRecord::Migration
  def change
    add_column :clients, :latitude, :integer
    add_column :clients, :longitude, :integer
  end
end

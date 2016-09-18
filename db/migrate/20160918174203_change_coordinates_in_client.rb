class ChangeCoordinatesInClient < ActiveRecord::Migration
  def change
    change_column :clients, :latitude, :float
    change_column :clients, :longitude, :float
  end
end

class ChangeBirthdateToDatetime < ActiveRecord::Migration
  def change
    remove_column :clients, :birthdate, :integer
    add_column :clients, :birthdate, :datetime  
  end
end

class AddVisitTodayToClients < ActiveRecord::Migration
  def change
    add_column :clients, :visit_today, :boolean
  end
end

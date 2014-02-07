class AddTeamNameToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :team_name, :string
  end
end

class AddPlayerRefToOwnerships < ActiveRecord::Migration
  def change
    add_reference :ownerships, :player, index: true
  end
end

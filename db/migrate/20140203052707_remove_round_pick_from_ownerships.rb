class RemoveRoundPickFromOwnerships < ActiveRecord::Migration
  def change
    remove_column :ownerships, :round, :integer
    remove_column :ownerships, :pick, :integer

    add_reference :ownerships, :order, index: true
  end
end

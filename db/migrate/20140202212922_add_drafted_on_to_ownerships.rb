class AddDraftedOnToOwnerships < ActiveRecord::Migration
  def change
    add_column :ownerships, :drafted_on, :datetime
  end
end

class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.integer :round
      t.integer :pick
      t.belongs_to :team, index: true

      t.timestamps
    end
  end
end

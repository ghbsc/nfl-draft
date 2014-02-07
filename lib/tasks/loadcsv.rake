
require 'csv'
 
namespace :loadcsv do
 
  task :cleanup => :environment do
    Order.destroy_all
    Player.destroy_all
    Team.destroy_all
  end
   
  task :teamcsv => :environment do
    #team_filename = File.expand_path("../teams.csv", __FILE__)
    team_filename = Rails.root + "db/teams.csv"
   
    CSV.foreach(team_filename, :headers => true) do |row|
      Team.create!(name: row['Team Name'].strip, division: row['Division'].strip)
    end
  end
   
  task :playercsv => :environment do
    player_filename = Rails.root + "db/players.csv"

    CSV.foreach(player_filename, :headers => true) do |row|
      Player.create!(name: row['Player Name'].strip, position: row['Position'].strip)
    end
  end
   
  task :ordercsv => :environment do
    order_filename = Rails.root + "db/order.csv"
    
    CSV.foreach(order_filename, :headers => true) do |row|
      team = Team.find_by name: row['Team Name'].strip.sub(/NY/, 'New York')

      team_id = nil 
      team_id = team.id unless team.nil?

      Order.create!(round: row['Round'], pick: row['Pick'], team_name: row['Team Name'].strip, team_id: team_id)
    end
  end

  task :all => [:cleanup, :teamcsv, :playercsv, :ordercsv]  

end

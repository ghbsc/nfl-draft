
namespace :simulatenfl do
 
  task :draft => :environment do
    #Clean up before the draft 
    Ownership.destroy_all
    Player.update_all('team_id = null')


    selected_player_ids = Array.new
    selected_player_ids << 0

    Order.all.each do |order|
      team = order.team
      player = Player.select(selected_player_ids)
      team.acquire(player)

      team.ownerships.create!(drafted_on: DateTime.now, team_id: team.id, order_id: order.id, player_id: player.id)
     
      selected_player_ids << player.id

      sleep(1.seconds)
    end

  end

end

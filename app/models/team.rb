class Team < ActiveRecord::Base
  has_many :players
  has_many :ownerships

  def acquire(player)
    the_player = Player.find_by(id: player.id)
    the_player.team_id = self.id 
    the_player.save! 
  end
end

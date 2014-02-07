module OwnershipsHelper
  def selected_round
    @players.first && @players.first.position || 'QB'
  end
  def selected_team
    @players.first && @players.first.position || 'QB'
  end
end

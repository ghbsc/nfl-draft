module PlayerHelper
  def selected_position
    @players.first && @players.first.position || 'QB'
  end
end

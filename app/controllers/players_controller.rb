class PlayersController < ApplicationController
  def index
    #@players = Player.search(params[:player][:position])
    @players = Player.search(params[:position])
  end
end

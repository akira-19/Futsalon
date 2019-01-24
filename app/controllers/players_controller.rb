class PlayersController < ApplicationController
  def show
  end

  def update
    player = Player.find(params[:id])
    player.default_team_id = player_params[:team_id].to_i
    player.save
    redirect_to root_path
  end

  def player_params
    params.permit(:team_id)
  end
end

class PlayersController < ApplicationController
  def show
  end

  def update
    player = Player.find_by(id: params[:id])
    player.default_team_id = params[:team_id]
    player.save
    redirect_to root_path
  end

  # ストロングパラメータ
end

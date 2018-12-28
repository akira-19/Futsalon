class PlayForsController < ApplicationController
  def new
  end

  def create
    @play_for = PlayFor.new
    @play_for.player_id = current_player.id
    @play_for.team_id = params[:team]
    @play_for.save
  end

  def edit
  end

  def update
    playfor = PlayFor.find_by(id: params[:id])
    playfor.register = params[:register]
    if playfor.save
      redirect_to root_path
    end
  end

  def destroy
    playfor = PlayFor.find_by(id: params[:id])
    playfor.destroy
  end
end

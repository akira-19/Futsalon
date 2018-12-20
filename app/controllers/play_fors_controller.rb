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
  end

  def destroy
  end
end

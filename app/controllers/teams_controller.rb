class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      # これはOKな書き方？
      PlayFor.create(player_id: current_player.id, team_id: @team.id)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    member_ids = PlayFor.where(team_id: params[:id]).select(:player_id)
    @members = Player.where(id: member_ids)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def team_params
      params.require(:team).permit(:name, :level)
    end

end

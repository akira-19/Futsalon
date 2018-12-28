class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    team = Team.new(team_params)
    if team.save
      # これはOKな書き方？Playforモデルに処理を写すべき？
      PlayFor.create(player_id: current_player.id, team_id: team.id, register: true, admin: true)
      current_player.default_team_id_register(team.id)

      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    all_member_ids = PlayFor.where(team_id: params[:id])
    @members = all_member_ids.where(register: true)
    @requests = all_member_ids.where(register: false)
    # member_ids = all_member_ids.where(register: true).select(:player_id)
    # request_ids = all_member_ids.where(register: false).select(:player_id)
    # @members = Player.where(id: member_ids)
    # @request_members = Player.where(id: request_ids)
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

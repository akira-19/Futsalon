class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    team = Team.new(team_params)
    if team.save
      play_for = PlayFor.new(player_id: current_player.id, team_id: team.id, register: true, admin: true)
      if play_for.save
        current_player.default_team_id_register(team.id)
        redirect_to root_path
      else
        render 'new'
      end
    else
      render 'new'
    end
  end

  def show
    all_members = PlayFor.where(team_id: params[:id])
    @members = all_members.where(register: true)
    @requests = all_members.where(register: false)

    @gole_array = get_row_number_in_position(all_members.where(position: "goleiro"))
    @fixo_array = get_row_number_in_position(all_members.where(position: "fixo"))
    @ala_array = get_row_number_in_position(all_members.where(position: "ala"))
    @pivo_array = get_row_number_in_position(all_members.where(position: "pivo"))
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

    def get_row_number_in_position(players)
      num = players.count
      player_array = []
      player_row_array = []
      n = 1
      players.each do |ply|
        player_row_array.push(ply)
        if n == num
          case n % 4
          when 1 then
            player_row_array.push(false,false,false)
          when 2 then
            player_row_array.push(false,false)
          when 3 then
            player_row_array.push(false)
          end
          player_array.push(player_row_array)
        elsif n % 4 == 0
          player_array.push(player_row_array)
          n += 1
          player_row_array = []
        else
          n += 1
        end
      end
      return player_array
    end

end

# home page
class StaticPagesController < ApplicationController
  def home
    if player_signed_in?
      team_ids = PlayFor.where(player_id: current_player.id).pluck(:team_id)
      @teams = Team.where(id: team_ids)
    end
  end

  def search
    if params[:team_name]
      @search_teams = Team.where("NAME LIKE ?", "%#{params[:team_name]}%")
      @requested_teams = PlayFor.where(team_id: @search_teams.map(&:id))
    end
    # render :home
  end


  def field
  end

  def feature1
  end

  def feature2
  end

  def feature3
  end
end

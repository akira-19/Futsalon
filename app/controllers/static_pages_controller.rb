# home page
class StaticPagesController < ApplicationController
  def home
    if player_signed_in?
      team_ids = PlayFor.where(player_id: current_player.id).select(:team_id)
      @teams = Team.where(id: team_ids)
    end
  end

  def login
  end

  def team
  end

  def tournament
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

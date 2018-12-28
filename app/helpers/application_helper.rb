# frozen_string_literal: true

module ApplicationHelper

  # 記憶したURL (もしくはデフォルト値) にリダイレクト
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # アクセスしようとしたURLを覚えておく
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  def team_admin_player?(player, team)
    PlayFor.find_by(player_id: player, team_id: team).admin
  end

  def current_team(player)
    Team.find_by(id: player.default_team_id)
  end

  def member_of_teams(player)
    playfor_team_id = PlayFor.where(player_id: player.id).pluck(:team_id)
    Team.where(id: playfor_team_id)
  end

end

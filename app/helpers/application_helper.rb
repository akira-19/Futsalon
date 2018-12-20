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

end

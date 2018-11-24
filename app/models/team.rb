class Team < ApplicationRecord
  has_many :players, through: :play_fors
  has_many :play_fors
  has_many :game_result_team1, class_name: 'GameResult', foreign_key: :team1_id
  has_many :game_result_team2, class_name: 'GameResult', foreign_key: :team2_id

  validates :name, presence: true
  validates :level, presence: true

end

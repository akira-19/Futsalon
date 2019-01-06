class Tournament < ApplicationRecord
  belongs_to :field
  has_many :teams, through: :booking_tournaments
  has_many :booking_tournaments

  with_options presence: true do
    validates :field_id
    validates :num_of_team
    validates :start_time
    validates :end_time
    validates :price
    validates :tounament_company_id
  end

  def self.search_tournament(fields, date)
    # それぞれのwhereをスコープで定義した方が良い
    # オブジェクトから特定のパラメータの配列を作成する場合はmapの方が良い
    where(field_id: fields.map(&:id))
        .where(start_time: date.beginning_of_day .. date.end_of_day)
  end




end

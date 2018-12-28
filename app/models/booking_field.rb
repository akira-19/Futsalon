class BookingField < ApplicationRecord
  belongs_to :field
  belongs_to :team

  with_options presence: true do
    validates :team_id
    validates :start_time
    validates :end_time
    validates :price
    validates :field_id
  end

  validates_with BookingTimeValidator
end

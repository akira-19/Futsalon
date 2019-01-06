# frozen_string_literal: true

class Field < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :teams, through: :booking_fields
  has_many :booking_fields
  has_many :tounaments
  has_many :game_results

  with_options presence: true do
    validates :name
    validates :prefecture
    validates :city
    validates :num_of_field
    validates :email
    validates :encrypted_password
  end

  def self.reserved_slots(fields, date)
    # Booking_fieldでスコープ、クラスメソッド への検討
    BookingField.where(field_id: fields.pluck(:id))
                              .where("start_time >= ? AND start_time < ?", date, date + 1)
  end


end

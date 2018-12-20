# frozen_string_literal: true
class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable#, :validatable, :trackable#,
         #:confirmable, :omniauthable#, omniauth_providers: [:twitter]

  has_many :teams, through: :play_fors
  has_many :play_fors

  validates :name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true

  def default_team_id(team_id)
    self.default_team_id ||= team_id
    self.save
  end

end

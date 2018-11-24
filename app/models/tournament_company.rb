class TournamentCompany < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tournaments

  with_options presence: true do
    validates :name
    validates :email
    validates :encrypted_password
  end
end

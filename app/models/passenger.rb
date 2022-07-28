class Passenger < ApplicationRecord
  belongs_to :booking
  has_many :tickets
  has_many :flights, through: :tickets

  validates :name, presence: true
  validates :email, presence: true
end

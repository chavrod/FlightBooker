class Booking < ApplicationRecord
  has_many :passengers, dependent: :destroy
  has_many :layovers, dependent: :destroy
  has_many :flights, through: :layovers
end
class Booking < ApplicationRecord
  has_many :passengers, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :flights, through: :tickets

  accepts_nested_attributes_for :passengers
end
class Ticket < ApplicationRecord
  belongs_to :booking
  belongs_to :flight
  belongs_to :passenger
end
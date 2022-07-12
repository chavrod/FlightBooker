class Booking < ApplicationRecord
  belongs_to :passnger
  belongs_to :flight
end

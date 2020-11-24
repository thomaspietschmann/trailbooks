class Reservation < ApplicationRecord
  belongs_to :itenerary
  belongs_to :accomodation
end

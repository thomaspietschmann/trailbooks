class Reservation < ApplicationRecord
  belongs_to :itinerary
  belongs_to :accommodation

  validates :checkin_date, presence: true
end

class Reservation < ApplicationRecord
  belongs_to :itinerary
  belongs_to :accommodation

  validates :start_date, :end_date, presence: true
end

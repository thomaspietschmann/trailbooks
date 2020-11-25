class Reservation < ApplicationRecord
  belongs_to :itenerary
  belongs_to :accomodation

  validates :start_date, :end_date, presence: true
end

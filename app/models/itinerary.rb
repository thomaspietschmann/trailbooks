class Itinerary < ApplicationRecord
  belongs_to :user
  belongs_to :trail
  has_many :reservations
  has_many :accommodations, through: :reservations
  has_many :accommodations, through: :trails
end

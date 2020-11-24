class Trail < ApplicationRecord
  has_many :itineraries
  has_many :trail_stages
  has_many :accomodations
  has_many_attached :photos
end

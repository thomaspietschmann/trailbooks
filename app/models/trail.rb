class Trail < ApplicationRecord
  has_many :itineraries
  has_many :trail_stages
  has_many :accommodations
  has_many_attached :photos
end

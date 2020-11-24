class Accomodation < ApplicationRecord
  belongs_to :trail
  has_many :reservations
  has_many_attached :photos
end

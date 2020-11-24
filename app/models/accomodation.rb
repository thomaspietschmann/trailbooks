class Accomodation < ApplicationRecord
  belongs_to :trail
  has_many :reservations
end

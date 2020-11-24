class TrailsController < ApplicationController
  def index
    @accomodations = Accomodation.all

    @markers = @accomodations.geocoded.map do |accomodation|
      {
        lat: accomodation.latitude,
        lng: accomodation.longitude
      }
    end
  end
end

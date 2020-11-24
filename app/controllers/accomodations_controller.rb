class AccomodationsController < ApplicationController
  def index
    @accomodations = Accomodation.all

    @markers = @accomodations.geocoded.map do |accomodation|
      {
        lat: accomodation.latitude,
        lng: accomodation.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { accomodation: accomodation })

      }
    end
  end
end

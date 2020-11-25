class TrailsController < ApplicationController
  def show
    @trail = Trail.find(params[:id])
    @accomodations = Accomodation.where(trail_id: params[:id])

    @markers = @accomodations.map do |accomodation|
      {
        lat: accomodation.latitude,
        lng: accomodation.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { accomodation: accomodation }),
        image_url: helpers.asset_url('mapbox-icon.png')
      }
    end
  end
end

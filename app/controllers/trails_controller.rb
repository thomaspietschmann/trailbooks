class TrailsController < ApplicationController
  def show
    @trail = Trail.find(params[:id])
    @accomodations = Accomodation.where(trail_id: params[:id])

    @markers = @accomodations.map do |accomodation|
      icon = assign_icon(accomodation.category)
      {
        lat: accomodation.latitude,
        lng: accomodation.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { accomodation: accomodation }),
        image_url: helpers.asset_url(icon)
      }
    end
  end

  private

  def assign_icon(category)
    if category == "Hut"
      image = 'mapbox-icon.png'
    elsif category == "Campsite"
      image = 'mapbox-icon2.png'
    end
  end
end

class TrailsController < ApplicationController
  before_action :set_trail, only: %i[show]

  def show
    @markers = build_markers
  end

  private

  def set_trail
    @trail = Trail.find(params[:id])
  end

  def assign_icon(category)
    category == "Hut" ? 'marker-enabled-hut.png' : 'marker-enabled-campsite.png'
  end

  def build_markers
    {
      accommodation: @trail.accommodations.map do |accommodation|
        {
          lat: accommodation.latitude,
          lng: accommodation.longitude,
          infoWindow: render_to_string(
            partial: "accommodation_popover",
            locals: { accommodation: accommodation }
          ),
          image_url: helpers.asset_url(assign_icon(accommodation.category))
        }
      end,
      trailstages: @trail.trail_stages.map do |trailstage|
        {
          lat: trailstage.latitude,
          lng: trailstage.longitude,
          num: trailstage.stage_number,
          infoWindow: render_to_string(
            partial: "trailstage_popover",
            locals: { trailstage: trailstage }
          )
        }
      end
    }
  end
end

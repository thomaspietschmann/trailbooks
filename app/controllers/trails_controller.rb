class TrailsController < ApplicationController
  before_action :set_trail, only: %i[show]
  before_action :set_itinerary, only: %i[show]

  def show
    @user = current_user
    @markers = build_markers
    @reservations = @user.itineraries.find_by(trail_id: @trail.id).reservations.all
  end

  private

  def set_trail
    @trail = Trail.find(params[:id])
  end

  def set_itinerary
    @user = current_user
    if @user.itineraries.find_by(trail_id: @trail.id).present?
      @user.itineraries.find_by(trail_id: @trail.id)
    else
      @itinerary = Itinerary.new
      @itinerary.user = @user
      @itinerary.trail = @trail
      @itinerary.save!
    end
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
          category: accommodation.category,
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

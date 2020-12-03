class ItinerariesController < ApplicationController
  def update
    @user = current_user
    @itinerary = Itinerary.find(params[:id])
    @reservations = @itinerary.reservations.all
    @reservations.each do |reservation|
      reservation.booked = true
      reservation.save
    end
    @title = "Your itinerary has been confirmed!"
    render "itineraries/confirmation"
  end
end

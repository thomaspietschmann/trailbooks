class ItinerariesController < ApplicationController
  def update
    @user = current_user
    @itinerary = Itinerary.find(params[:id])
    @reservations = @itinerary.reservations.all
    @reservations.each do |reservation|
      reservation.booked = true
      reservation.save
    end
    @title = "Confirmed!"
    render "itineraries/confirmation"
  end
end

class AccommodationsController < ApplicationController
  def show
    @accommodation = Accommodation.find(params[:id])
    @reservation = Reservation.new()
    render layout: false
  end
end

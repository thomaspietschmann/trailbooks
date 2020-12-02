class ReservationsController < ApplicationController
  def index
    # @reservations = Reservation.where(user: current_user)
    # respond_to do |format|
    #   format.html
    #   format.json { render json: { reservations: @reservations } }
    # end
  end

  def new
    @accommodation = Accommodation.find(params[:accommodation_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservations_params)
    @user = current_user
    @accommodation = Accommodation.find(params[:accommodation_id])
    @trail = @accommodation.trail
    @itinerary = @user.itineraries.find_by(trail_id: @trail.id)
    @reservation.itinerary = @itinerary
    @reservation.accommodation = @accommodation
    @reservation.save!
    render partial: "trails/itinerary",
           locals: {
             reservations: @itinerary.reservations.order(:checkin_date)
           }
  end

  # def update
  #   @reservation = Reservation.find(params[:id])
  #   @reservation.update(reservation_params)
  #   redirect_to reservation_path(@reservation)
  # end

  def destroy
    @reservation = Reservation.find(params[:id])
    @itinerary = @reservation.itinerary
    @reservation.destroy
    render partial: "trails/itinerary",
           locals: {
             reservations: @itinerary.reservations.order(:checkin_date)
           }
  end

  private

  def reservations_params
    params.require(:reservation).permit(:checkin_date)
  end
end

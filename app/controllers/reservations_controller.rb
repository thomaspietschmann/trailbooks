class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user: current_user)
    respond_to do |format|
      format.html
      format.json { render json: { reservations: @reservations } }
    end
  end

  def new
    @accommodation = Accommodation.find(params[:accommodation_id])
    @reservation = Reservation.new
  end

  def create
    @user = current_user
    @accommodation = Accommodation.find(params[:accommodation_id])
    @trail = @accommodation.trail
    @reservation = Reservation.new(reservations_params)
    # start_date = Date.parse(params[:reservation][:start_date])
    # end_date = Date.parse(params[:reservation][:end_date])
    # total_price = (end_date - start_date).to_i * @accommodation.total_price
    # @reservation.total_price = total_price
    @itinerary = @user.itineraries.find_by(trail_id: @trail.id)
    @reservation.itinerary = @itinerary
    @reservation.accommodation = @accommodation
    @reservation.save
      render partial: "trails/itinerary",
          locals: {
            reservations: current_user.reservations
          }
    # if @reservation.save
    #   redirect_to trail_path(@trail)
    # end
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)

    redirect_to reservation_path(@reservation)
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy

    redirect_to reservations_path
  end

  private

  def reservations_params
    params.require(:reservation).permit(:checkin_date)
  end
end

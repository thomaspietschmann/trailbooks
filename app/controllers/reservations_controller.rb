class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user: current_user)
  end

  def new
    @accommodation = Accommodation.find(params[:accommodation_id])
    @reservation = Reservation.new
  end

  def create
    @accommodation = Accommodation.find(params[:accommodation_id])
    @reservation = reservation.new(reservation_params)
    start_date = Date.parse(params[:reservation][:start_date])
    end_date = Date.parse(params[:reservation][:end_date])
    total_price = (end_date - start_date).to_i * @accommodation.total_price
    @reservation.total_price = total_price
    @reservation.itinerary = current_itinerary
    @reservation.accommodation = @accommodation
    if @reservation.save
      redirect_to reservations_path
    else
      render "new"
    end
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

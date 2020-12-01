class AccommodationsController < ApplicationController
  def show
    @accommodation = Accommodation.find(params[:id])
    @reservation = Reservation.new
    render layout: false
  end

  def toilet
    @toilet = false
  end

  def dinner
    @dinner = false
  end

  def lunch
    @lunch = false
  end

  def breakfast
    @breakfast = false
  end
end

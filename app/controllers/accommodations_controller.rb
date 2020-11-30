class AccommodationsController < ApplicationController
  def show
    @accommodation = Accommodation.find(params[:id])
    render layout: false
  end
end

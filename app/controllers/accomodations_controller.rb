class AccomodationsController < ApplicationController
  def show
    @accomodation = Accomodation.find(params[:id])
    render layout: false
  end
end

class AccomodationsController < ApplicationController
  def show
    @accomodation = Accomodation.find(params[:id])
  end
end

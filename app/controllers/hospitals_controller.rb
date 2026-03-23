class HospitalsController < ApplicationController
 def index
  if params[:query].present?
    @hospitals = Hospital.where(
      "name LIKE ? OR city LIKE ?",
      "%#{params[:query]}%",
      "%#{params[:query]}%"
    )
  else
    @hospitals = Hospital.all
    end
  end

  def show
    @hospital = Hospital.find(params[:id])
  end
end

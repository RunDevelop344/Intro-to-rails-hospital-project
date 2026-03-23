class HospitalsController < ApplicationController
  def index
    hospitals = if params[:query].present?
                  Hospital.where(
                    "name LIKE ? OR city LIKE ?",
                    "%#{params[:query]}%",
                    "%#{params[:query]}%"
                  )
                else
                  Hospital.all
                end

    @hospitals = hospitals.page(params[:page]).per(9)
  end

  def show
    @hospital = Hospital.find(params[:id])
  end
end
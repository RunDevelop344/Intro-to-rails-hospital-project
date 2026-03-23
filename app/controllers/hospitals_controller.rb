class HospitalsController < ApplicationController
  def index
    hospitals = if params[:query].present?
                Hospital
                  .left_joins(:departments)
                  .where(
                    "hospitals.name LIKE :q
                     OR hospitals.city LIKE :q
                     OR departments.name LIKE :q",
                    q: "%#{params[:query]}%"
                  )
                  .distinct
              else
                Hospital.all
              end


    @hospitals = hospitals.page(params[:page]).per(9)
  end

  def show
    @hospital = Hospital.find(params[:id])
  end
end
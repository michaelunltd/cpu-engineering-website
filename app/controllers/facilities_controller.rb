class FacilitiesController < ApplicationController
  before_action :find_facility, only: [:show, :edit, :destroy, :update]

  def index
    @facilities = Facility.all
  end

  def show
  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facility_params)

    if @facility.save
      redirect_to facilities_path
    else
      flash[:notice] = "facility was not updated."
      render :new
    end
  end

  def edit
  end

  def update
    if params[:facility][:remove_image] == '1'
      @facility.remove_image!
    end

    if @facility.update(facility_params)
      redirect_to facilities_path
    else
      flash[:notice] = "facility was not updated."
      render :edit
    end
  end

  def destroy
    if @facility.destroy
      redirect_to facilities_path
    end
  end

  private

  def facility_params
    params.require(:facility).permit(:name, :description, :image, :image_cache)
  end

  def find_facility
    @facility = Facility.find params[:id]
  end
end

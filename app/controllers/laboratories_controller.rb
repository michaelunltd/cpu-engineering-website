class LaboratoriesController < ApplicationController
  before_action :find_laboratory, only: [:show, :edit, :destroy, :update]

  def index
    @laboratories = Laboratory.all
  end

  def show
  end

  def new
    @laboratory = Laboratory.new
  end

  def create
    @laboratory = Laboratory.new(laboratory_params)

    if @laboratory.save
      redirect_to laboratories_path
    else
      flash[:notice] = "Laboratory was not updated."
      render :new
    end
  end

  def edit
  end

  def update
    if params[:laboratory][:remove_image] == '1'
      @laboratory.remove_image!
    end

    if @laboratory.update(laboratory_params)
      redirect_to laboratories_path
    else
      flash[:notice] = "Laboratory was not updated."
      render :edit
    end
  end

  def destroy
    if @laboratory.destroy
      redirect_to laboratories_path
    end
  end

  private

  def laboratory_params
    params.require(:laboratory).permit(:name, :description, :image, :image_cache)
  end

  def find_laboratory
    @laboratory = Laboratory.find params[:id]
  end
end

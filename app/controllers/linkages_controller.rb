class LinkagesController < ApplicationController
  load_and_authorize_resource
  before_action :find_linkage, only: [:show, :edit, :destroy, :update]

  def index
    @linkages = Linkage.includes(:department)
  end

  def show
  end

  def new
    @linkage = Linkage.new
  end

  def create
    @linkage = Linkage.new(linkage_params)

    if @linkage.save
      redirect_to linkages_path
    else
      flash[:notice] = "Linkage was not updated."
      render :new
    end
  end

  def edit
  end

  def update
    if params[:linkage][:remove_image] == '1'
      @linkage.remove_image!
    end

    if @linkage.update(linkage_params)
      redirect_to linkages_path
    else
      flash[:notice] = "Linkage was not updated."
      render :edit
    end
  end

  def destroy
    if @linkage.destroy
      redirect_to linkages_path
    end
  end

  private

  def linkage_params
    params.require(:linkage).permit(:name, :description, :image, :image_cache, :department_id)
  end

  def find_linkage
    @linkage = Linkage.find params[:id]
  end
end

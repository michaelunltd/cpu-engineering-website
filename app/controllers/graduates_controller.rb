class GraduatesController < ApplicationController
  load_and_authorize_resource
  before_action :find_graduate, only: [:show, :edit, :destroy, :update]

  def show
  end

  def index
    @graduates = Graduate.includes(:department)
  end

  def new
    @graduate = Graduate.new
  end

  def create
    @graduate = Graduate.new(graduate_params)

    if @graduate.save
      redirect_to graduates_path
    else
      flash[:notice] = "Graduate was not added"
      render :new
    end
  end

  def edit
  end

  def update
    if params[:graduate][:remove_photo] == '1'
      @graduate.remove_photo!
    end

    if @graduate.update(graduate_params)
      redirect_to graduates_path
    else
      flash[:notice] = "Graduate was not updated."
      render :edit
    end
  end

  def destroy
    if @graduate.destroy
      redirect_to graduates_path
    end
  end

  private

  def find_graduate
    @graduate = Graduate.find params[:id]
  end

  def graduate_params
    params.require(:graduate).permit(:first_name,:middle_name, :last_name, :photo, :photo_cache, :year_graduated, :awards, :department_id)
  end

end

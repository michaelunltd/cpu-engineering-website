class DepartmentsController < ApplicationController
load_and_authorize_resource
before_action :find_department, only: [:show, :edit, :destroy, :update]

  def index
    @departments = Department.includes(:employees,:linkages)
  end

  def show
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)

    if @department.save
      redirect_to departments_path
    else
      flash[:notice] = 'Department was not added.'
      render :new
    end
  end

  def edit
  end

  def update
    if params[:department][:remove_logo] == '1'
      @department.remove_logo!
    end

    if @department.update(department_params)
      redirect_to departments_path
    else
      flash[:notice] = 'Department was not updated.'
      render :edit
    end
  end

  def destroy
    if @department.destroy
      redirect_to departments_path
    end
  end


  private

  def department_params
    params.require(:department).permit(:name, :about, :message, :vision, :mission, :history, :logo, :logo_cache, :employees)
  end

  def find_department
    @department = Department.find params[:id]
  end

end

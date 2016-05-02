class DepartmentsController < ApplicationController
before_action :find_department, only: [:show, :edit, :destroy, :update]

  def index
    @departments = Department.all
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
      flash[:notice] = 'Department WAS NOT added.'
      render :new
    end
  end

  def edit
  end

  def update
    if params[:department][:remove_image] == '1'
      @department.remove_image!
    end

    if @department.update(department_params)
      redirect_to departments_path
    else
      flash[:notice] = 'Department WAS NOT updated.'
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
    params.require(:department).permit(:name, :about, :message, :vision, :mission, :history, :logo, :logo_cache)
  end

  def find_department
    @department = Department.find params[:id]
  end

end

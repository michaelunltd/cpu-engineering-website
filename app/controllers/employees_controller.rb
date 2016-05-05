class EmployeesController < ApplicationController
  load_and_authorize_resource
  before_action :find_employee, only: [:show, :edit, :destroy, :update]

  def show
  end

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employees_path
    else
      flash[:notice] = "Employee was not added"
      render :new
    end
  end

  def edit
  end

  def update
    if params[:employee][:remove_photo] == '1'
      @employee.remove_photo!
    end

    if @employee.update(employee_params)
      redirect_to employees_path
    else
      flash[:notice] = "Employee was not updated."
      render :edit
    end
  end

  def destroy
    if @employee.destroy
      redirect_to employees_path
    end
  end

  private

  def find_employee
    @employee = Employee.find params[:id]
  end

  def employee_params
    params.require(:employee).permit(:first_name,:middle_name, :last_name, :photo, :photo_cache, :position, :honorifics, :counseling_hours, :department)
  end

end

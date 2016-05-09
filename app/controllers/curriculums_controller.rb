class CurriculumsController < ApplicationController
  load_and_authorize_resource
  before_action :find_curriculum, only: [:show, :edit, :destroy, :update]

  def show
  end

  def show_all
    @curriculums = Curriculum.all
  end

  def index
    @department = Department.find params[:department_id]
    @curriculums = @department.curriculums
  end

  def new
    @curriculum = Curriculum.new
  end

  def create
    @curriculum = Curriculum.new(curriculum_params.merge(:department_id => params[:department_id]))

    if @curriculum.save
      redirect_to department_curriculums_path
    else
      render :new
      flash[:notice] = "Curriculum was not added"
    end
  end

  def edit
  end

  def update
    @currciulum = Curriculum.update(curriculum_params.merge(:department_id => params[:department_id]))
  end

  def destroy
    @curriculum.destroy
    redirect_to department_curriculums_path(params[:department_id])

  end

  private

  def curriculum_params
    params.require(:curriculum).permit(:name, :attachment)
  end

  def find_curriculum
    @curriculum = Curriculum.find params[:id]
  end
end

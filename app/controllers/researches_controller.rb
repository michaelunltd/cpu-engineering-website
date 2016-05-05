class ResearchesController < ApplicationController
  load_and_authorize_resource
  before_action :find_research, only: [:show, :edit, :destroy, :update]

  def show_all
    @researches = Research.all
  end

  def show
  end

  def index
    @department = Department.find params[:department_id]
    @researches = @department.researches
  end

  def new
    @research = Research.new
    @research.department_id = params[:department_id]
  end

  def create
    @research = Research.new(research_params)

    if @research.save
      redirect_to department_researches_path(params[:department_id])
    else
      flash[:notice] = "Research was not added."
      render :new
    end
  end

  def edit
    @department_id = params[:department_id]
  end

  def update
    @research.remove_attachment! if params[:research][:remove_attachment] == '1'

    if @research.update(research_params)
      redirect_to department_researches_path(params[:department_id])
    else
      flash[:notice] = "Research was not updated."
      render :edit
    end
  end

  def destroy
    @research.destroy
    redirect_to department_researches_path(params[:department_id])
  end

  private

  def research_params
    params.require(:research).permit(:title, :summary, :group_name, :attachment, :department_id)
  end

  def find_research
    @research = Research.find params[:id]
  end
end

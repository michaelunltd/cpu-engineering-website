class OutreachProgramsController < ApplicationController
  before_action :find_outreach_program, only: [:show, :edit, :destroy, :update]

  def index
    @outreach_programs = OutreachProgram.all
  end

  def show
  end

  def new
    @outreach_program = OutreachProgram.new
  end

  def create
    @outreach_program = OutreachProgram.new(outreach_program_params)
    if @outreach_program.save
      redirect_to outreach_programs_path
    else
      flash[:notice] = 'Outreach Program WAS NOT added.'
      render :new
    end
  end

  def edit
  end

  def update
    if @outreach_program.update(outreach_program_params)
      redirect_to outreach_programs_path
    else
      flash[:notice] = 'Outreach Program WAS NOT updated.'
      render :edit
    end
  end

  def destroy
    @outreach_program.destroy
    redirect_to outreach_programs_path
  end

private

  def outreach_program_params
    params.require(:outreach_program).permit(:name, :description)
    # params.require(:news).permit(:title, :content, :image, :author)
  end

  def find_outreach_program
    @outreach_program = OutreachProgram.find params[:id]
  end
end

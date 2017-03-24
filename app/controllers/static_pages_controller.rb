class StaticPagesController < ApplicationController
  before_action :find_research, only: [:show, :edit, :destroy, :update]

  def about_engineering
    render "static_pages/about_engineering"
  end

  def student_life
    render "static_pages/student_life"
  end

  def study_in_cpu
    render "static_pages/study_in_cpu"
  end

  def contact_us
    render "static_pages/contact_us"
  end

  def show
  end

  def new
    @static_page = StaticPage.new
  end

  def create
    @static_page = StaticPage.new(static_page_params)

    if @static_page.save
      redirect_to about_engineering_path
    else
      flash[:notice] = "Static Page was not added."
      render :new
    end

  end

  def edit
  end

  def update
    if @static_page.update static_page_params
      redirect_to about_engineering_path
    else
      flash[:notice] = "Static Page was not updated."
      render :new
    end
  end

  def destroy
    @static_page.destroy
    redirect_to about_engineering_path
  end

  private

  def static_page_params
    params.require(:static_page).permit(:name, :content)
  end

  def find_research
    @static_page = StaticPage.find params[:id]
  end
end

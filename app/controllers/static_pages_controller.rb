class StaticPagesController < ApplicationController

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
end

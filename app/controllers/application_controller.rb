class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_departments

  rescue_from CanCan::AccessDenied do |_exception|
    flash[:alert] = 'You are unauthorized!'
    if logged_in?
      redirect_to :back
    else
      redirect_to :login
    end
  end

  private
    
  def set_departments
    @departments = Department.all.order(:name)
  end

end

class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:show, :destroy]

  def index
    @users = User.includes(:department)
  end

  def show
  end

  def new
    @user = User.new
    @departments = Department.all
  end

  def create
    @user = User.new(user_params)
    @departments = Department.all

    if @user.save
      redirect_to users_path
    else
      flash[:notice] = 'User was not added.'
      render :new
    end
  end

  # TODO: Add messages of success at deletion
  def destroy
    @user.destroy
    flash[:success] = 'User was deleted.'
    redirect_to users_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation,
       :department_id, :role)
    end
end

class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:username], params[:password])
      redirect_back_or_to(:users, notice: 'Login successful')
    else
      flash[:alert] = 'Login failed'
      render :new
    end
  end

# TODO: I think when logged out, user should be sent to somewhere else
  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end

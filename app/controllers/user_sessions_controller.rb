class UserSessionsController < ApplicationController
  def new
    if logged_in?
      flash[:notice] = 'You are already logged in'
      redirect_to :back
    else
      @user = User.new
    end
  end

  # TODO: logging in doesnt redirect you back to where you came from
  def create
    if @user = login(params[:username], params[:password])
      redirect_to(:users, notice: 'Login successful')
    else
      flash[:alert] = 'Login failed'
      render :new
    end
  end

# TODO: I think when logged out, user should be sent to somewhere else
  def destroy
    logout
    redirect_to('/', notice: 'Logged out!')
  end
end

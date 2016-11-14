class SessionsController < ApplicationController

  # GET /sessions/new
  def new
    # set error if you have error
    @user = User.new()
  end

  # POST /sessions
  def create
    @user = User.authenticate(params[:user])
    if  @user
      session[:id] = @user.id
      redirect_to root_path
    else
      flash[:error] = "Invalid username or password..."
      redirect_to new_session_path
    end
  end

  # DELETE /sessions
  def destroy
  end

end

class SessionsController < ApplicationController

  # GET /sessions/new
  def new
    # set error if you have error
    @user = User.new()
  end

  # POST /sessions
  def create
    flash[:error] = "Invalid username or password..."
    redirect_to new_session_path
  end

  # DELETE /sessions
  def destroy
  end

end

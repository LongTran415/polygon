module ApplicationHelper
  # def current_user
  #   @current_user ||= session[:id] = @current_user.id if session[:id]
  # end
  def logged_in?
    session.has_key?(:id)
  end
end

class ApplicationController < ActionController::Base
  helper_method :current_profile

  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do
    render 'pages/not_found', status: 404
  end

  private
  def authenticate_profile!
    redirect_to new_developer_session_path unless current_profile
  end

  def current_profile
    @profile ||= Profile.find(session[:profile_id]) if session[:profile_id]
  end
end

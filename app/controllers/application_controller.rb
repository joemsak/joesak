class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  helper_method :current_profile

  protect_from_forgery with: :exception

  def not_found
    render 'pages/not_found', status: 404
  end

  def welcome
    render 'pages/welcome'
  end

  private
  def authenticate_profile!
    redirect_to sign_in_path unless current_profile
  end

  def current_profile
    if session[:authenticated_id]
      @current_profile ||= Profile.find(session[:authenticated_id])
    end
  end
end

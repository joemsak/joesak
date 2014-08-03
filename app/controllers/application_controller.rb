class ApplicationController < ActionController::Base
  helper_method :current_profile

  protect_from_forgery with: :exception

  private
  def current_profile
    @profile ||= Profile.last
  end
end

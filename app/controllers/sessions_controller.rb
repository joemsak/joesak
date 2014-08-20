class SessionsController < ApplicationController
  def create
    if profile = Profile.authenticate(params[:username], params[:password])
      session[:profile_id] = profile.id
      redirect_to profiles_root_path
    else
      render :new
    end
  end
end
class SessionsController < ApplicationController
  def create
    if Authentication.authenticate(params, session)
      flash[:notice] = t('sessions.sign_in.correct')
      redirect_to root_profile_path
    else
      flash.now[:error] = t('sessions.sign_in.incorrect')
      render :new
    end
  end

  def destroy
    session[:profile_id] = nil
    flash[:notice] = t('sessions.logged_out')
    redirect_to root_path
  end
end

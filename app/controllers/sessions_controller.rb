class SessionsController < ApplicationController
  def create
    if authenticated
      session[:authenticated_id] = authenticated.id
      flash[:notice] = t('sessions.sign_in.correct')
      redirect_to root_profile_path
    else
      flash.now[:error] = t('sessions.sign_in.incorrect')
      render :new
    end
  end

  def destroy
    session[:authenticated_id] = nil
    flash[:notice] = t('sessions.logged_out')
    redirect_to root_path
  end

  private
  def authenticated
    @authenticated ||=
      Authentication.authenticate(params[:username], params[:password])
  end
end

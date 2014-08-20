class ProfilesController < ApplicationController
  before_filter :authenticate_profile!, only: :yours

  def yours
    @profile = ProfileDecorator.new(current_profile)
    render template: 'profiles/show'
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      session[:authenticated_id] = @profile.id
      redirect_to root_profile_path
    else
      render :new
    end
  end

  def show
    @profile = Profile.decorated(slug, with: :gists)
  end

  private
  def slug
    params[:id]
  end

  def profile_params
    params[:profile].permit(:username, :password, :password_confirmation)
  end
end

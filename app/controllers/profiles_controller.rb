class ProfilesController < ApplicationController
  def show
    @profile = Profile.decorated(slug)
  end

  private
  def slug
    params[:id]
  end
end

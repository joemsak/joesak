class ProfilesController < ApplicationController
  def show
    @profile = Profile.decorated(slug, with: :gists)
  end

  private
  def slug
    params[:id]
  end
end

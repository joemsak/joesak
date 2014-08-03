class ProfilesController < ApplicationController
  def show
    @profile = Profile.friendly.find(params[:id]).decorate
  end
end

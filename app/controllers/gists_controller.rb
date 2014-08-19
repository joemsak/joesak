class GistsController < ApplicationController
  before_filter :authenticate_profile!

  def new
    @gist = current_profile.gists.build
  end

  def create
    @gist = current_profile.gists.build(gist_params)
    if @gist.save
    else
      render :new
    end
  end

  private
  def gist_params
    params[:gist].permit(:remote_id)
  end
end

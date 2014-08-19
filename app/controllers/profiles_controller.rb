class ProfilesController < ApplicationController
  def yours
    @profile = ProfileDecorator.new(current_profile)
    render template: 'profiles/show'
  end

  def show
    @profile = Profile.decorated(slug, with: :gists)
  end

  private
  def slug
    params[:id]
  end
end

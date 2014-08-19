require 'rails_helper'

feature 'Page not found' do
  scenario 'ActiveRecord::RecordNotFound is rescued and redirected' do
    page = ProfilePage.new('foo')
    page.visit
    expect(page.status_code).to eq(404)
    expect(page).to have_content(page.not_found_title)
    expect(page).to have_content(page.not_found_content)
  end

  scenario 'ActionController::RoutingError is rescued and redirected' do
    page = PageBase.new
    page.visit('/foo/bar')
    expect(page.status_code).to eq(404)
    expect(page).to have_content(page.not_found_title)
    expect(page).to have_content(page.not_found_content)
  end
end

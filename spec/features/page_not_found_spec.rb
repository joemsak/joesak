require 'rails_helper'

feature 'Page not found' do
  scenario 'ActiveRecord::RecordNotFound is rescued and redirected' do
    page = ProfilePage.new('foo')
    page.visit
    expect(page).to have_content(page.not_found_title)
    expect(page).to have_content(page.not_found_content)
  end
end

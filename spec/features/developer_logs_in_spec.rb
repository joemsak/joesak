require 'rails_helper'

feature 'Profile logs in' do
  scenario 'successfully' do
    profile = create(:profile)
    page = LoginPage.new

    page.visit
    page.fill_in_form(profile)
    page.submit_form

    expect(current_path).to eq(page.success_path)
  end
end

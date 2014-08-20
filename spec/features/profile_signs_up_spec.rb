require 'rails_helper'

feature 'Profile signs up' do
  scenario 'successfully' do
    page = NewProfilePage.new
    page.visit
    page.fill_in_form('username', 'password')

    expect {
      page.submit_form
    }.to change { Profile.count }.from(0).to(1)
  end
end

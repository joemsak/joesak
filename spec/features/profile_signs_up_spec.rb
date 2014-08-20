require 'rails_helper'

feature 'Profile signs up' do
  scenario 'successfully' do
    page = NewProfilePage.new
    page.visit
    page.fill_in_form('username', 'password')

    expect {
      page.submit_form
    }.to change { Profile.count }.from(0).to(1)

    expect(current_path).to eq(root_profile_path)
  end
end

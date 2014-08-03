require 'rails_helper'

feature 'Guest visits profile page' do
  scenario 'a blank profile' do
    create(:profile, username: 'joemsak', name: 'Joe Sak')
    page = ProfilePage.new('joemsak')

    page.visit
    expect(page).to have_content('Joe Sak does not have any information.')
  end

  scenario 'a profile with a summary' do
    create(:profile, summary: 'Here is my information',
                     username: 'joemsak',
                     name: 'Joe Sak')
    page = ProfilePage.new('joemsak')

    page.visit
    expect(page).to have_content('Joe Sak')
    expect(page).to have_content('Here is my information')
    expect(page).not_to have_content('Joe Sak does not have any information.')
  end
end

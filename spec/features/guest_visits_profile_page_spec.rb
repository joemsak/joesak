require 'rails_helper'

feature 'Guest visits profile page' do
  scenario 'for a blank profile and sees that there is no information' do
    create(:profile, username: 'joemsak', name: 'Joe Sak')
    page = ProfilePage.new('joemsak')

    page.visit
    expect(page).to have_content('Joe Sak does not have any information.')
  end

  scenario 'with a summary and sees the summary' do
    create(:profile, summary: 'Here is my information',
                     username: 'joemsak',
                     name: 'Joe Sak')
    page = ProfilePage.new('joemsak')

    page.visit
    expect(page).to have_content('Joe Sak')
    expect(page).to have_content('Here is my information')
    expect(page).not_to have_content('Joe Sak does not have any information.')
  end

  scenario 'with attached gists and sees the gists' do
    profile = create(:profile, username: 'joemsak')
    page = ProfilePage.new('joemsak')
    profile.gists.create!(attributes_for(:gist))

    page.visit
    expect(page).to have_gist('hello_world.rb')
  end
end

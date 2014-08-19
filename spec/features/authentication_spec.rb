require 'rails_helper'

feature 'Authentication' do
  scenario 'guests are restricted from new gist page' do
    page = NewGistPage.new
    page.visit
    expect(current_path).to eq(new_session_path)
  end

  scenario 'guests are restricted from profile#yours' do
    page = YourProfilePage.new
    page.visit
    expect(current_path).to eq(new_session_path)
  end
end

require 'rails_helper'

feature 'Authentication' do
  scenario 'guests are restricted from new gist page' do
    page = NewGistPage.new
    page.visit

    expect(current_path).to eq(new_developer_session_path)
  end
end

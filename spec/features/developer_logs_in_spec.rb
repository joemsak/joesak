require 'rails_helper'

feature 'Developer logs in' do
  scenario 'successfully' do
    developer = create(:developer)
    page = LoginPage.new

    page.visit
    page.fill_in_form(developer)
    page.submit_form

    expect(current_path).to eq(root_developer_path)
  end
end

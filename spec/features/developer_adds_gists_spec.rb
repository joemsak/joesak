require 'rails_helper'

feature 'Developer adds gists to profile' do
  scenario 'with no input and sees a validation error' do
    page = NewGistPage.new
    as_developer do
      page.visit
      page.fill_in_remote_finder(nil)
      page.submit_form
      expect(page).to have_validation_error(:remote_finder, :blank)
    end
  end
end

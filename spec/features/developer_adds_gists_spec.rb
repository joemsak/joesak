require 'rails_helper'

feature 'Developer adds gists to profile' do
  let(:page) { NewGistPage.new }

  scenario 'with no input and sees a validation error' do
    as_developer do
      page.visit
      page.fill_in_remote_finder(nil)
      page.submit_form
      expect(page).to have_validation_error(:remote_finder, :blank)
    end
  end

  scenario 'with a full url redirects to developer page' do
    as_developer do |dev|
      page.visit
      page.fill_in_remote_finder('https://gist.github.com/blah/123abc')
      page.submit_form
      gist = GistDecorator.new(dev.gists.first)

      expect(current_path).to eq(root_developer_path)
      expect(page).to have_content(gist.title)
    end
  end
end

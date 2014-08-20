require 'rails_helper'

feature 'Profile logs out' do
  scenario 'successfully' do
    logout_page = PageBase.new

    as_profile do
      visit logout_path
      expect(current_path).to eq(root_path)
      expect(page).to have_content(logout_page.logged_out_text)
    end
  end
end

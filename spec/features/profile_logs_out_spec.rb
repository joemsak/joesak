require 'rails_helper'

feature 'Profile logs out' do
  scenario 'successfully' do
    sign_out_page = PageBase.new

    as_profile do
      visit sign_out_path
      expect(current_path).to eq(root_path)
      expect(page).to have_content(sign_out_page.logged_out_text)
    end
  end
end

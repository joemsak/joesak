require 'rails_helper'

describe Profile, '.decorated' do
  it 'finds with friendly slug and decorates' do
    create(:profile, username: 'sluggy')
    profile = Profile.decorated('sluggy')

    expect(profile).to respond_to(:information) # decorator function
    expect(profile.username).to eq('sluggy')
  end

  it 'takes eager loading options' do
    create(:profile, username: 'sluggy')
    expect(Profile).to receive(:includes).with(:gists) { Profile }
    Profile.decorated('sluggy', with: :gists)
  end
end

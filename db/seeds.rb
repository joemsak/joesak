if Profile.find_by(username: 'joemsak')
  $stdout << "Profile 'joemsak' exists.\n"
else
  if profile = Profile.create!(username: 'joemsak',
                               name: 'Joe Sak',
                               password: 'secret',
                               password_confirmation: 'secret')
    $stdout << "Profile 'joemsak' created.\n"
  else
    $stdout << "Could not create a profile for 'joemsak'"
    profile.errors.full_messages.each do |msg|
      $stdout << msg << "\n"
    end
  end
end

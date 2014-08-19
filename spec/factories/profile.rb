FactoryGirl.define do
  factory :profile, aliases: [:developer] do
    username 'joemsak'
    password 'secret'
    password_confirmation 'secret'
  end
end

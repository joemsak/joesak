class Profile < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged
end

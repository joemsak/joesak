class Profile < ActiveRecord::Base
  include Authentication
  extend FriendlyId
  friendly_id :username, use: :slugged

  has_many :gists

  class << self
    def decorated(slug, options = {})
      includes(options[:with]).friendly.find(slug).decorate
    end
  end
end

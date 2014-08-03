class Profile < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged

  has_many :gists

  class << self
    def decorated(slug)
      includes(:gists).friendly.find(slug).decorate
    end
  end
end

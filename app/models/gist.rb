class Gist < ActiveRecord::Base
  belongs_to :profile

  validates :remote_id, presence: true
end

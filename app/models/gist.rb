class Gist < ActiveRecord::Base
  belongs_to :profile

  before_save :format_remote_id

  validates :remote_id, presence: true

  private
  def format_remote_id
    self.remote_id = formatted_remote_id
  end

  def formatted_remote_id
    self.remote_id = if capture = remote_id.match(/\/([\w\d]+)\/?$/)
                       capture[1]
                     else
                       remote_id
                     end
  end
end

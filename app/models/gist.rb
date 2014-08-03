class Gist < ActiveRecord::Base
  belongs_to :profile

  def title
    'hello_world.rb'
  end
end

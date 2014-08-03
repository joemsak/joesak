class GistDecorator < Draper::Decorator
  delegate_all

  def title
    "hello_world.rb"
  end
end

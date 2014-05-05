class HtmlConsumer
  attr_accessor :dir

  def initialize(dir)
    @dir = dir
  end

  def files
    Dir.glob("#{dir}/*/index.html") << "#{dir}/index.html"
  end
end

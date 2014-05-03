class JsonWriter
  attr_accessor :body, :filepath

  def initialize(body, filepath)
    @body = body
    @filepath = "#{filepath}.json"
  end

  def write
    File.open(filepath, 'w+') do |f|
      f.write(body)
    end
  end
end

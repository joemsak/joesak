require './lib/html_consumer'
require './lib/html_to_json'
require './lib/json_writer'

class JsonGenerator
  attr_accessor :consumer

  def initialize
    @consumer = consumer_klass.new('.')
  end

  def generate
    consumer.files.each do |filepath|
      html = File.read(filepath).strip
      json = convertor_klass.new(html).parse
      path = filepath.sub(/\.html/, '')
      path = path.sub(/(\w)\/index/, '\1')

      writer_klass.new(json, path).write
    end
  end

  private
  def consumer_klass
    HtmlConsumer
  end

  def convertor_klass
    HtmlToJson
  end

  def writer_klass
    JsonWriter
  end
end

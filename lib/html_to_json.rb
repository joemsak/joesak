require 'json'
require 'nokogiri'

class HtmlToJson
  attr_accessor :source, :title, :body

  def initialize(source)
    @source = parser.parse(source)
  end

  def parse
    @title = get_title
    @body  = get_body
    { title: title, body: body }.to_json
  end

  private
  def get_title
    get_by_css('#title', :text)
  end

  def get_body
    body = get_by_css('#body', :inner_html)
    body.gsub(/\n\s*/, '')
  end

  def get_by_css(selector, method)
    source.css(selector).send(method)
  end

  def parser
    Nokogiri::HTML::Document
  end
end

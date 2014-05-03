require 'html_to_json'

describe HtmlToJson do
  let(:html) do
    <<-HTML
      <header>
        <h1 id="title">Joe Sak</h1>
      </header>
      <section id="body">
        <p>My cool page</p>
      </section>
    HTML
  end

  subject(:generator) { HtmlToJson.new(html) }

  describe '#initialize' do
    it 'parses the source' do
      Nokogiri::HTML::Document.should_receive(:parse).with(html)
      generator
    end
  end

  describe '#parse' do
    it 'finds the #title' do
      generator.parse
      generator.title.should == 'Joe Sak'
    end

    it 'finds the #body' do
      generator.parse
      generator.body.should == '<p>My cool page</p>'
    end

    it 'returns the json object' do
      generator.parse.should == { title: 'Joe Sak',
                                  body: '<p>My cool page</p>' }.to_json
    end
  end
end

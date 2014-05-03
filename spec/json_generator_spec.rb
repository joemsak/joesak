require 'json_generator'

describe JsonGenerator do
  subject(:generator) { JsonGenerator.new }

  describe '#initialize' do
    it 'sets up the consumer' do
      HtmlConsumer.should_receive(:new).with('.')
      generator
    end
  end

  describe '#generate' do
    let(:json) { { key: 'value' }.to_json }

    before do
      HtmlConsumer.any_instance.stub(:files) {
        ['spec/support/otherdir/index.html',
         'spec/support/welcome/index.html']
      }

      HtmlToJson.any_instance.stub(:parse) { json }
    end

    it 'reads the html of each file through HtmlToJson' do
      ['<p>otherdir html</p>','<p>welcome html</p>'].each do |html|
        HtmlToJson.should_receive(:new).with(html).and_call_original
      end

      generator.generate
    end

    it 'passes the json and filepaths to JsonWriter' do
      writer = double(:writer)
      ['spec/support/otherdir', 'spec/support/welcome'].each do |path|
        JsonWriter.should_receive(:new).with(json, path).and_return(writer)
      end
      writer.should_receive(:write).twice

      generator.generate
    end
  end
end

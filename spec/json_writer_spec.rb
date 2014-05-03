require 'json'
require 'json_writer'

describe JsonWriter do
  let(:json) { { key: 'value' }.to_json }
  subject(:writer) { JsonWriter.new(json, 'spec/support/welcome') }

  describe '#initialize' do
    it 'creates the filepath' do
      writer.filepath.should == 'spec/support/welcome.json'
    end

    it 'accepts JSON as the body' do
      writer.body.should == json
    end
  end

  describe '#write' do
    it 'creates new files in the directory given' do
      writer.write
      contents = File.read('spec/support/welcome.json')
      contents.should == json
    end
  end
end

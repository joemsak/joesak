require 'html_consumer'

describe HtmlConsumer do
  describe '#files' do
    it 'returns an array of all the index.html filepaths' do
      consumer = HtmlConsumer.new('spec/support')
      consumer.files.should == ['spec/support/otherdir/index.html',
                                'spec/support/welcome/index.html',
                                'spec/support/index.html']
    end
  end
end

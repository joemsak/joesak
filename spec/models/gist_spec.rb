require 'rails_helper'

describe Gist do
  describe '.before_save' do
    context ':format_remote_id' do
      it 'grabs the ID out of a URL' do
        url = 'https://gist.github.com/anonymous/1234abc'
        gist = create(:gist, remote_id: url)
        expect(gist.remote_id).to eq('1234abc')
      end

      it 'ignores plain old IDs' do
        gist = create(:gist, remote_id: 'plainoldid')
        expect(gist.remote_id).to eq('plainoldid')
      end
    end
  end
end

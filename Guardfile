guard 'jekyll' do
  watch /.*/
  ignore /_site/
end

guard 'sass', :input => 'css', :output => 'css/compiled'

guard :shell do
  watch(/index\.html/) {|m| `bin/generate_json` }
end

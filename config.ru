require File.dirname(__FILE__) + '/config/boot.rb'

map "/assets" do
  run JoeSak.sprockets
end

run Rack::URLMap.new({
  "/"    => JoeSak
})

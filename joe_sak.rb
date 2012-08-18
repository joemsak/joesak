require "./helpers/asset_helpers"
require "./helpers/sprockets_helpers"

class JoeSak < Sinatra::Base
  include SprocketsHelpers

  helpers do
    include AssetHelpers
  end

  get '/' do
    erb :home
  end
end

class JoeSak < Sinatra::Base
  get '/' do
    erb :home
  end
end

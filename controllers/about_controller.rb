require('sinatra')
require('sinatra/contrib/all')
require('pry')
also_reload('../models/*')

get '/about' do
  erb (:"about/index")
end

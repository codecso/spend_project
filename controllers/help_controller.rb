require('sinatra')
require('sinatra/contrib/all')
require('pry')
also_reload('../models/*')

get '/help' do
  erb (:"help/index")
end

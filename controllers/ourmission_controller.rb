require('sinatra')
require('sinatra/contrib/all')
require('pry')
also_reload('../models/*')

get '/ourmission' do
  erb (:"ourmission/index")
end

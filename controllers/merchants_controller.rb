require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/merchant.rb')
also_reload('../models/*')

get '/merchants' do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

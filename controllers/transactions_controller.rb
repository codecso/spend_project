require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/transaction.rb')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
also_reload('../models/*')

get '/transactions' do
  @transactions = Transaction.all()
  erb (:"transactions/index")
end

get '/transactions/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb (:"transactions/new")
end

post '/transactions' do
  Transaction.new(params).save
  redirect to '/transactions'
end

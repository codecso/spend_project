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
  Transaction.new(params).save()
  redirect to '/transactions'
end

get '/transactions/ascending' do
  @transactions = Transaction.transaction_date_ascending()
  erb (:"transactions/index")
end

get '/transactions/descending' do
  @transactions = Transaction.transaction_date_descending()
  erb (:"transactions/index")
end

get '/transactions/:id' do
  @transaction = Transaction.find(params['id'])
  erb(:"transactions/show")
end

get '/transactions/:id/edit' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  @transaction = Transaction.find(params['id'])
  erb(:"transactions/edit")
end

post '/transactions/:id' do
  Transaction.new(params).update()
  redirect to "/transactions"
end

post '/transactions/:id/delete' do
  transaction = Transaction.find(params['id'])
  transaction.delete()
  redirect to ('/transactions')
end

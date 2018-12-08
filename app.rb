require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/about_controller.rb')
require_relative('controllers/help_controller.rb')
require_relative('controllers/ourmission_controller.rb')
require_relative('controllers/transactions_controller.rb')
also_reload('./models/*')

get '/' do
  erb(:index)
end

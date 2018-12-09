require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/tag.rb')
also_reload('../models/*')

get '/tags' do
  @tags = Tag.all()
  erb(:"tags/index")
end

post '/tags/:id/delete' do
  Tag.delete(params[:id])
  redirect to('/tags')
end

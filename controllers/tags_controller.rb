require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/tag.rb')
also_reload('../models/*')

get '/tags' do
  @tags = Tag.all()
  erb(:"tags/index")
end

get '/tags/new' do
  erb (:"tags/new")
end

post '/tags' do
  Tag.new(params).save()
  redirect to '/tags'
end

get '/tags/:id' do
  @tags = Tag.all()
  @tag = Tag.find(params['id'])
  erb(:"tags/show")
end

get '/tags/:id/edit' do
  @tag = Tag.find(params['id'])
  erb(:"tags/edit")
end

get '/tags/:id/transactions' do
  @tag = Tag.find(params['id'])
  erb(:"tags/tag_transactions")
end

post '/tags/:id' do
  tag = Tag.new(params)
  tag.update()
  redirect to "/tags"
end

post '/tags/:id/delete' do
  tag = Tag.find(params['id'])
  tag.delete()
  redirect to ('/tags')
end

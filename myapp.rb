 
 require 'rubygems'
 require 'bundler/setup'
 Bundler.require
 require './models/TodoItem'

if ENV['DATABASE_URL']
   ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
else
   ActiveRecord::Base.establish_connection(
	:adapter  => 'sqlite3',
  	:database => 'db/development.db',
  	:encoding => 'utf8'
)
end

get '/' do
@items = TodoItem.all
erb :sinatra
end

post '/delete/:id' do

TodoItem.find(params[:id]).destroy

redirect '/'
end


post '/list' do
TodoItem.create(description: params[:task], due_date: params[:date])
redirect '/'
end

post '/deletes' do


TodoItem.find_by(description: params[:task]).destroy

redirect '/'
end


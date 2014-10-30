 
 require 'rubygems'
 require 'bundler/setup'
 Bundler.require
require './models/TodoItem'
ActiveRecord::Base.establish_connection(
	:adapter  => 'sqlite3',
  	:database => 'db/development.db',
  	:encoding => 'utf8'
)

get '/' do
@items = TodoItem.all
erb :sinatra
end


post '/list' do

TodoItem.create(description: params[:task], due_date: params[:date])



redirect '/'
end

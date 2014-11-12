 
 require 'rubygems'
 require 'bundler/setup'
 Bundler.require
 require './models/User'
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


get '/:user' do
@user= User.find(params[:user])
@items = @user.todo_items.order(:due_date)
erb :sinatra
end




post '/:user/new_item' do
User.find(params[:user]).todo_items.create(description: params[:task], due_date: params[:date])
redirect "/#{params[:user]}"
end

post '/delete/:id' do

@todo_items = TodoItem.find(params[:id])
@user = @todo_items.user
@todo_items.destroy
redirect "/#{@user.id}"

end





post '/create_user' do
@user=User.create(params)
redirect '/'

end

post '/delete_user/:id' do

User.find(params[:id]).destroy
redirect "/#{params[:user]}"

end

get '/' do
@users = User.all.order(:name)
erb :users

end
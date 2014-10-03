 
 require 'rubygems'
 require 'bundler/setup'
 Bundler.require


file_contents = File.read('list.txt')

lines= file_contents.split("\n")

lines.each do |line|

task, date = line.split("-")
puts" #{task}: #{date}"

end


get '/' do
file = File.read('list.txt')
@lines = file.split("\n")
erb :sinatra
end


post '/list' do
File.open("list.txt","a") do |file|
file.puts "#{params[:task]} - #{params[:date]}"
end
redirect '/'
end

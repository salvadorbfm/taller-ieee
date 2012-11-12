require 'sinatra'

get '/' do
   erb :home
end

get %r{/hi/([\d]+)} do
 	"Accessing parameters via regex"
	"Hello, #{params[:captures].first}!"
end

#Accesing paramaters via block parameters
get '/hi/:name' do |n|
	#'Trying to get name'
    "Accessing parameters via block parameters"
    "Hi #{n}!"
end



post '/register' do
	"Let's register #{params[:email]}"
end



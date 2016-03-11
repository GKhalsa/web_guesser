require 'sinatra'
require 'sinatra/reloader'

number = rand(4)
get '/' do
  erb :index, :locals => { :number => number }
end

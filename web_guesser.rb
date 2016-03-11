require 'sinatra'
require 'sinatra/reloader'

number = rand(4)
get '/' do
  "The secret number is #{number}".upcase
end

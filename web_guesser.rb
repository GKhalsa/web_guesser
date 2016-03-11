require 'sinatra'
require 'sinatra/reloader'
require 'pry'

NUMBER = rand(4)

def check_guess(guess)
  if guess > NUMBER
    high_guess(guess)
  elsif guess < NUMBER
    low_guess(guess)
  elsif guess == NUMBER
    'Nice one! You got it!'
  end
end

def high_guess(guess)
  guess >= NUMBER + 5 ? "Way to high!" : "Too high!"
end

def low_guess(guess)
  guess <= NUMBER - 5 ? "Way to Low" : "Too Low!"
end


get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => { :number => NUMBER, :message => message }
end

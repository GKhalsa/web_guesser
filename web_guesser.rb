require 'sinatra'
require 'sinatra/reloader'
require 'pry'

NUMBER = rand(4)
$color = "white"

def check_guess(guess)
  if guess > NUMBER
    high_guess(guess)
  elsif guess < NUMBER
    low_guess(guess)
  elsif guess == NUMBER
    $color = "green"
    'Nice one! You got it!'
  end
end

def high_guess(guess)
  guess >= NUMBER + 5 ? way_high : high
end

def way_high
  $color = "red"
  "Way to high!"
end

def high
  $color = "pink"
  "Too high!"
end

def low_guess(guess)
  guess <= NUMBER - 5 ? way_low : low
end

def way_low
  $color = "red"
  "Way to low!"
end

def low
  $color = "pink"
  "Too low!"
end


get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => { :number => NUMBER, :message => message, :color => $color }
end

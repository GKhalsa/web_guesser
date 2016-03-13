require 'sinatra'
require 'sinatra/reloader'
require 'pry'

$number = rand(4)
$color = "white"
$guesses = 0

def check_guess(guess)
  if guess > $number
    high_guess(guess)
  elsif guess < $number
    low_guess(guess)
  elsif guess == $number
    $color = "green"
    'Nice one! You got it!'
    $guesses = 0
    $number =  rand(4)
  end
end

def guess_num
  $guesses += 1
  if $guesses == 5
    $guesses = 0
    $number = rand(4)
    "Sorry, you are out of guesses, the secret num has been reset."
  else
    "You have #{5 - $guesses} guesses left."
  end
end

def high_guess(guess)
  guess >= $number + 5 ? way_high : high
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
  guess <= $number - 5 ? way_low : low
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
  guess_message = guess_num
  erb :index, :locals => { :number => $number, :message => message, :color => $color, :guess_message => guess_message }
end

require 'sinatra'
require_relative 'lib/scrabblesinatra'

class Scrabble < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/score_many' do
     @words = params["user_word"]
     word_string = @words.split(' ')

      word_string.each do |word|
       @score_many = Scoring.score(word)
     end

     #split @word_played into an array
     #then score each element with a loop
    erb :score

  end

  post '/score' do
    @word_played = params["user_word"]
     @score = Scoring.score(@word_played)
    erb :score
  end

  get '/score' do
    erb :score
  end

  get '/score_many' do
    erb :score_many
  end

  run!
end

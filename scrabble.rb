require 'sinatra'
require_relative 'lib/scrabblesinatra'

class Scrabble < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/score_many' do
     @words_played = params["user_word"]
     word_string = @words_played.split(' ')
     @score_many = []
      word_string.each do |word|
      @score = Scoring.score(word)
      @score_array = @score_many << @score
     end
     @score_hash = Hash[@words_played.split(' ').zip @score_array]
    #  @scored_words = @score_many.reduce(:+)
    erb :score_many

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

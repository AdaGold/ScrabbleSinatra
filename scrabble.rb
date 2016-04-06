require 'sinatra'


class Scrabble < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/score' do
    erb :score
  end

  get '/score_many' do
    erb :score_many
  end

  run!
end

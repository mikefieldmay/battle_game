require 'sinatra/base'
require 'sinatra'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

enable :sessions
  get '/' do

    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:name1])
    player_2 = Player.new(params[:name2])
    $game = Game.new(player_1, player_2)
    redirect "/play"
  end

  get '/play' do
    @game = $game
    erb :names
  end

  post '/attack' do
    @game = $game
    @game.attack(@game.player2)
    redirect "/play"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

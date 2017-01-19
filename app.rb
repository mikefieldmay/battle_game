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
    @name1 = $game.player1.name
    @name2 = $game.player2.name
    @attack = session[:attack]
    @confirmation ="#{@name1} attacks #{@name2}"
    erb :names
  end

  post '/attack' do
    $game.attack($game.player2)
    session[:attack] = true
    redirect "/play"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

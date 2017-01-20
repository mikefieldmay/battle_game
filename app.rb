require 'sinatra/base'
require 'sinatra'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  before  do
    @game = Game.instance
  end

  enable :sessions
    get '/' do
      erb :index
    end

  post '/names' do
    player_1 = Player.new(params[:name1])
    player_2 = Player.new(params[:name2])
    @game = Game.create(player_1, player_2)
    redirect "/play"
  end

  get '/play' do
    erb :names
  end

  post '/attack' do
    @game.attack
    redirect "/play" unless @game.game_over?
    redirect "/game_over"
  end

  get '/game_over' do
    erb :game_over
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

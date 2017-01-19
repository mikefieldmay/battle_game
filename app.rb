require 'sinatra/base'
require 'sinatra'
require './lib/player'

class Battle < Sinatra::Base

enable :sessions

  get '/' do

    erb :index
  end

  post '/names' do
    $player1 = Player.new(params[:name1])
    $player2 = Player.new(params[:name2])
    redirect "/play"
  end

  get '/play' do
    @name1 = $player1.name
    @name2 = $player2.name
    @attack = session[:attack]
    @confirmation ="#{@name1} attacks #{@name2}"
    erb :names
  end

  post '/attack' do
    $player2.attacked
    session[:attack] = true
    redirect "/play"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

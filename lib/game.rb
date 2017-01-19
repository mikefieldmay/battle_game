class Game
  attr_reader :players, :current_player, :opponent

  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player = player1
    @opponent = player2
  end

  def player1
    players.first
  end

  def player2
    players.last
  end

  def attack
    opponent.received_attack
    change_turn
  end

  def change_turn
    @current_player,@opponent = @opponent,@current_player
  end

end

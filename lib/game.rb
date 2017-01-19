class Game
  attr_reader :players, :attacked, :current_player, :other_player

  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player = player1
    @other_player = player2
  end

  def player1
    players.first
  end

  def player2
    players.last
  end

  def attack
    @attacked = true
    other_player.received_attack
    change_turn
  end

  def change_turn
    @current_player,@other_player = @other_player,@current_player
  end

end

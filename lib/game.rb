class Game
  attr_reader :player1, :player2, :attacked, :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def attack(player)
    @attacked = true
    player.received_attack
  end

end

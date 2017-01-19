class Game
  attr_reader :player1, :player2, :attacked

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    # @attack = nil
  end

  def attack(player)
    @attacked = true
    player.received_attack
  end

end

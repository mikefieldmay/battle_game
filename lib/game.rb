class Game
  attr_reader :players, :attacked, :current_player

  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player = player1
    @other_player = player2
  end

  def player1
    players.first.name
  end

  def player2
    players.last.name
  end

  def attack
    @attacked = true
    players.select { |player| player != current_player }.received_attack
    change_turn
  end

  def change_turn
    current_player == player1 ? @current_player = player2 : @current_player = player1
  end

end

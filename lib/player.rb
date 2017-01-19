class Player
  attr_reader :name, :hit_points
  DEFAULT_HP = 20

  def initialize(name)
    @name = name
    @hit_points = DEFAULT_HP
  end

  def received_attack
    @hit_points -= 10
  end

end

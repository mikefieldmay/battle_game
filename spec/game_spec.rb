require 'game'

describe Game do
  let(:player1) {double :player}
  let(:player2) {double :player}
  subject(:game) {described_class.new(player1, player2)}

  describe"#default" do
    it {is_expected.to respond_to(:player1)}
    it {is_expected.to respond_to(:player2)}
  end

  describe "#attack" do
    it {is_expected.to respond_to(:attack).with(1).argument}

    it "causes HP damage to a player" do
      expect(player1).to receive(:attacked)
      game.attack(player1)
    end
  end
end

require 'game'

describe Game do
  let(:player_1) {double :player}
  let(:player_2) {double :player}
  subject(:game) {described_class.new(player_1, player_2)}

  describe "#attack" do
    it {is_expected.to respond_to(:attack).with(1).argument}

    it "causes HP damage to a player" do
      expect(player_2).to receive(:attacked)
      game.attack(player_2)
    end
  end
end

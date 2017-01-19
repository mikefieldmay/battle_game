require 'game'

describe Game do
  let(:player1) {double :player1}
  let(:player2) {double :player2}
  subject(:game) {described_class.new(player1, player2)}

  describe"#default" do
    it {is_expected.to respond_to(:player1)}
    it {is_expected.to respond_to(:player2)}
  end

  describe "#attack" do

    it "causes HP damage to a player" do
      expect(player2).to receive(:received_attack)
      game.attack
    end

    it "changes the player's turn" do
      allow(player2).to receive(:received_attack)
      game.attack
      expect(game.current_player).to eq player2
    end
  end

  describe "#change_turn" do
    it {is_expected.to respond_to(:change_turn)}
  end
end

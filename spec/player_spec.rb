require 'player'

describe Player do

  subject(:player) {described_class.new(:name)}
  let(:name) {double "name"}

  describe "#name" do
    it "is expected to respond to name" do
      is_expected.to respond_to(:name)
    end
    it "returns the name" do
      expect(player.name).to eq(:name)
    end

  end
end

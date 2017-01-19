require 'player'

describe Player do

  subject(:dave) {described_class.new("Dave")}

  describe "#default" do
    it "is expected to respond to name" do
      is_expected.to respond_to(:name)
    end
    it "returns the name" do
      expect(dave.name).to eq("Dave")
    end
    it "initializes with 20HP" do
      expect(dave.hit_points).to eq 20
    end
  end

end

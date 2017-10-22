require "spec_helper"

RSpec.describe Hand do
  let(:card_array) {[Card.new('J','♦'), Card.new('A','♠')]}
  let(:hand) { Hand.new(card_array) }
  let(:hand2) { Hand.new([Card.new('10','♦'), Card.new('J','♥')]) }
  let(:hand3) { Hand.new([Card.new('A','♦'), Card.new('A','♥')]) }

  describe "#initialize" do
    it "creates a Hand object" do
      expect(hand).to be_a(Hand)
    end
  end

  describe '#cards' do
    it "returns the cards in hand" do
      expect(hand.cards).to eq(card_array)
    end
  end

  describe '#calculate_hand' do
    it "calculates the value of the hand" do
      expect(hand.calculate_hand).to eq(21)
    end
    it "calculates 12 for 2 aces" do
      expect(hand3.calculate_hand).to eq(12)
    end
  end
end

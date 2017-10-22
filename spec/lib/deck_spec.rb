require "spec_helper"

RSpec.describe Deck do
  let(:deck) { Deck.new }

  describe '#initialize' do
    it "returns a Deck" do
      expect(deck).to be_a(Deck)
    end
  end

  describe '#deal' do
    it "removes a card from collection" do
      deck.deal
      expect(deck.collection.length).to eq(51)
    end

    it "removes card that is dealt from collection" do
      drawn_card = deck.deal
      expect(deck.collection.include?(drawn_card)).to eq(false)
    end
  end

  describe '#shuffle' do
    it "shuffles the deck" do
      original_order = ''
      deck.collection.each do |card|
        original_order += card.rank.to_s + card.suit.to_s
      end

      new_order = ''
      deck.shuffle!
      deck.collection.each do |card|
        new_order += card.rank.to_s + card.suit.to_s
      end

      expect(new_order).not_to eq(original_order)
    end
  end
end

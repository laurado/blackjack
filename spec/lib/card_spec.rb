require "spec_helper"

RSpec.describe Card do
  let(:card) { Card.new("2", "♥") }
  let(:ace) { Card.new("A", "♥") }
  let(:face) { Card.new("Q", "♥") }


  describe "#initialize" do
    it "is a Card object" do
      expect(card).to be_a(Card)
    end

    it "has a rank" do
      expect(card.rank).to eq("2")
    end

    it "has a suit" do
      expect(card.suit).to eq("♥")
    end
  end

  describe '#rank' do
    it "has a reader for rank" do
      expect(card.rank).to eq("2")
    end
  end

  describe '#suit' do
    it "has a reader for suit" do
      expect(card.suit).to eq("♥")
    end
  end

  describe "#ace?" do
    it "returns true if the card is an ace" do
      expect(ace.ace?).to eq(true)
    end

    it "returns false if the card is not an ace" do
      expect(card.ace?).to eq(false)
      expect(face.ace?).to eq(false)
    end
  end

  describe "#face_card?" do
    it "returns true if the card is a face card" do
      expect(face.face_card?).to eq(true)
    end

    it "returns false if the card is not a face card" do
      expect(ace.face_card?).to eq(false)
    end
  end

  describe "number_card?" do
    it "returns true if the card is a number card" do
      expect(card.number_card?).to eq(true)
    end

    it "returns false if the card is not a number card" do
      expect(ace.number_card?).to eq(false)
    end
  end

  describe '#value' do
    it "has a reader for value" do
      expect(card.value).to eq(2)
    end
  end

end

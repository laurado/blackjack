require_relative "./card"

SUITS = ['♦', '♣', '♠', '♥']
RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

class Deck
  attr_reader :collection

  def initialize
    @collection = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @collection << Card.new(rank, suit)
      end
    end
  end

  def shuffle!
    @collection.shuffle!
  end

  def deal
    @collection.pop
  end
end

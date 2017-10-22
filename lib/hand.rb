class Hand
  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def add_card(cards)
      @cards << cards
  end

  def calculate_hand
    total = 0
    elevens = 0

    @cards.each do |card|
      if card.rank == 'A'
        total += card.value
        elevens += 1
      else
        total += card.value
      end
    end

    while total > 21 && elevens > 0
      total -= 10
      elevens -= 1
    end
    total
  end

end

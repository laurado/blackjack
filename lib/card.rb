VALUES = {"2"=> 2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9,
  "10"=>10, "J"=>10, "Q"=>10, "K"=>10, "A"=>11}

class Card
  attr_reader :rank, :suit, :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = VALUES[rank]
  end

  def ace?
    @rank == "A"
  end

  def face_card?
    "JQK".include?(@rank)
  end

  def number_card?
    !ace? && !face_card?
  end
end

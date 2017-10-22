require_relative "card"
require_relative "deck"
require_relative "hand"

player = Hand.new
computer = Hand.new

deck = Deck.new
deck.shuffle!

puts "Welcome to Blackjack!\n\n"

player.add_card(deck.deal)
puts "Player was dealt #{player.cards[0].rank}#{player.cards[0].suit}"

computer.add_card(deck.deal)
puts "Dealer was dealt #{computer.cards[0].rank}#{computer.cards[0].suit}"

player.add_card(deck.deal)
puts "Player was dealt #{player.cards[1].rank}#{player.cards[1].suit}"

computer.add_card(deck.deal)
puts "Dealer was dealt the hole card"

puts "\nPlayer score: #{player.calculate_hand}\n\n"

#handle player hand
while player.calculate_hand < 21
  print "Hit or stand? (H/S): "
  input = gets.chomp.upcase

  if input == "H"
    player.add_card(deck.deal)
    puts "Player was dealt #{player.cards[-1].rank}#{player.cards[-1].suit}"
    puts "\nPlayer score: #{player.calculate_hand}"
  elsif input == "S"
    puts "\nPlayer score: #{player.calculate_hand}"
    break
  else
    puts "\nPlease enter a valid input"
  end
end

#if player hand is over 21, they lose
#if player hand is 21, they win
#if player hand is less than 21, then dealer's turn
if player.calculate_hand > 21
  puts "Bust! You lose!"
elsif player.calculate_hand == 21
  puts "Hooray! You win!"
else
  puts "\nDEALER'S TURN"
  puts "Dealer's hole card is #{computer.cards[1].rank}#{computer.cards[1].suit}"
  # puts "Dealer's total: #{computer.calculate_hand}"

  while computer.calculate_hand < 17
    computer.add_card(deck.deal)
    puts "Dealer was dealt #{computer.cards[-1].rank}#{computer.cards[-1].suit}"
  end
  puts "\nDealer score: #{computer.calculate_hand}"

  if computer.calculate_hand > 21
    puts "\nDealer busts, you win!"
  elsif player.calculate_hand > computer.calculate_hand
    puts "\nYou beat the dealer!"
  elsif player.calculate_hand < computer.calculate_hand
    puts "\nDealer has a higher score, you lose."
  else
    puts "\nYou and the dealer tie!"
  end
end

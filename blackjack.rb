
puts "Enter your name:"
name = gets.chomp
puts "Hi, #{name}! Welcome to Our Casino"

suits = ['H', 'D', 'S', 'C']
symbols = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']

deck = suits.product(symbols)

shuffled_deck = deck.shuffle!

begin

def count_cards(hand)
	total = 0
	hand.each do |card|
		if card[1] == 'A'
			total += 11
			if total > 21
				total -= 10
			end
		elsif card[1].to_i == 0
			total += 10
		else
			total += card[1]
		end
	end
	total
end

player_hand = []
dealer_hand = []

player_hand << shuffled_deck.pop
dealer_hand << shuffled_deck.pop
player_hand << shuffled_deck.pop
dealer_hand << shuffled_deck.pop


if count_cards(player_hand) == 21 && count_cards(dealer_hand) != 21
	puts "Your hand is: #{player_hand}"
	puts "Congrats, #{name}! You've hit blackjack - Ching Ching"
	exit
elsif count_cards(player_hand) == 21 && count_cards(dealer_hand) == 21
	puts "Your hand is: #{player_hand}"
	puts "Dealer's hand is: #{dealer_hand}"
	puts "Both sides have blackjack - It's a push"
	exit
elsif count_cards(player_hand) != 21 && count_cards(dealer_hand) == 21
	puts "Dealer's hand is: #{dealer_hand}"
	puts "Sorry, #{name}. Dealer has hit blackjack"
	exit
end

puts "This is your hand: #{player_hand[0]}, #{player_hand[1]}"
puts "This is the part of dealer's hand: #{dealer_hand[0]}"


puts "Your current card count totals: #{count_cards(player_hand)}"

#player's turn 

while count_cards(player_hand) < 21
	puts "#{name}, Would you like to hit or stay: 1) hit 2) stay"
	player_call = gets.chomp.to_i
	if player_call == 1
		player_hand << shuffled_deck.pop
		puts "Your new hand is: #{player_hand}"
		puts "=> You have: #{count_cards(player_hand)}"
		if count_cards(player_hand) == 21
			puts "Congrats, #{name}! You've hit blackjack - You won"
			exit
		elsif count_cards(player_hand) > 21
			puts "Sorry, #{name}. You've busted - You lose"
			exit
		end
	elsif player_call == 2
		puts "#{name}, You've decided to stay"
		puts "=> You have: #{count_cards(player_hand)}"
		break
	else
		puts "Oops! Someone's got the case of fat fingers - You need to choose 1 or 2"
	end
end
		

#dealer's turn
if count_cards(dealer_hand) >= 17
	puts "Dealer's full hand is: #{dealer_hand}"
	puts "=> Dealer has: #{count_cards(dealer_hand)}"
	if count_cards(player_hand) > count_cards(dealer_hand)
		puts "Congrats, #{name}! You win"
		exit
	elsif count_cards(player_hand) < count_cards(dealer_hand)
		puts "Sorry, #{name}. You lose and Dealer wins"
		exit
	else
		puts "It's a push - You tie"
		exit
	end
end

while count_cards(dealer_hand) < 17
	dealer_hand << shuffled_deck.pop
	count_cards(dealer_hand)
	puts "Dealer's full/new hand is: #{dealer_hand}"
	puts "=> Dealer has: #{count_cards(dealer_hand)}"
	if count_cards(dealer_hand) == 21
		puts "Sorry, #{name}. Dealer has hit blackjack - You lose"
		exit
	elsif count_cards(dealer_hand) > 21
		puts "Yay - Dealer's busted - You win"
		exit
	end
end

if count_cards(dealer_hand) >= 17
	if count_cards(player_hand) > count_cards(dealer_hand)
		puts "Congrats, #{name}! You win"
	elsif count_cards(player_hand) < count_cards(dealer_hand)
		puts "Sorry, #{name}. You lose and Dealer wins"
	else
		puts "It's a push - You tie"
	end
end

puts "Would you like to play again: (Y/N)?"
play_again = gets.chomp.upcase

end until play_again == "N" || shuffled_deck.count < 10 
	if shuffled_deck < 10
		puts "Sorry, Time for a break. We are running low on cards"
	end







def count_cards(hand)
	total = 0
	hand.each do |card|
		if card[1] == 'A'
			total += 11
		elsif card[1].to_i == 0
			total += 10
		else
			total += card[1]
		end
	end

	hand.select {|card| card[1] == 'A'}.count.times do
		total -= 10	if total > 21
	end
	total
end

def player_round(player_hand, shuffled_deck, name)

	puts "This is your hand: #{player_hand}"

	if count_cards(player_hand) == 21
		puts "Congrats, #{name}! You've hit blackjack - You won"
	elsif count_cards(player_hand) > 21
		puts "Sorry, #{name}. You've busted - You lose"
	else
		puts "#{name}, Would you like to hit or stay: 1) hit 2) stay"
		player_call = gets.chomp.to_i
		if player_call == 1
			player_hand << shuffled_deck.pop
			player_round(player_hand, shuffled_deck, name)
		elsif player_call == 2
			puts "#{name}, You've decided to stay"
		else
			puts "Oops! Someone's got the case of fat fingers - You need to choose 1 or 2"
		end
	end
	puts "=> You have: #{count_cards(player_hand)}"
	count_cards(player_hand)
end

def dealer_round(dealer_hand, shuffled_deck, name)

	puts "Dealer's full hand is: #{dealer_hand}"

	if count_cards(dealer_hand) == 21
		puts "Sorry, #{name}. Dealer has hit blackjack"
	elsif count_cards(dealer_hand) > 21
		puts "Yay - Dealer's busted"
	elsif count_cards(dealer_hand).between?(17,21)
		puts "Dealer stays"
		puts "Dealer has: #{count_cards(dealer_hand)}"
	else
		dealer_hand << shuffled_deck.pop
		puts "Dealer has taken another card"
		dealer_round(dealer_hand, shuffled_deck, name)
	end
	count_cards(dealer_hand)
end

def winner(player, dealer, name)
	if player > dealer || dealer > 21
		puts "Congrats, #{name}! You win"
	elsif player < dealer || dealer == 21
		puts "Sorry, #{name}. You lose and Dealer wins"
	else
		puts "It's a push - You tie"
	end
end

def play_blackjack

	puts "Enter your name:"
	name = gets.chomp
	puts "Hi, #{name}! Welcome to Our Casino"

	suits = ['H', 'D', 'S', 'C']
	symbols = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']

	original_deck = suits.product(symbols)
	deck = []
	deck.concat(original_deck)
	deck.concat(original_deck)
	deck.concat(original_deck)

	shuffled_deck = deck.shuffle!


	begin

		player_hand = []
		dealer_hand = []

		player_hand << shuffled_deck.pop
		dealer_hand << shuffled_deck.pop
		player_hand << shuffled_deck.pop
		dealer_hand << shuffled_deck.pop

		puts "This is the face card of dealer's hand: #{dealer_hand[0]}"

#player's turn
		player_value = player_round(player_hand, shuffled_deck, name)

#dealer's turn
		if player_value <= 21
			dealer_value = dealer_round(dealer_hand, shuffled_deck, name)
			winner(player_value, dealer_value, name)
		end

		puts "Would you like to play again: (Y/N)?"
		play_again = gets.chomp.upcase

		end until play_again == "N"
end

play_blackjack

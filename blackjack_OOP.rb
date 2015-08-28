class Card
  attr_accessor :suit, :face_value

  def initialize (s, fv)
    @suit = s
    @face_value = fv
  end

  def to_s
    "The #{face_value} of #{find_suit}"
  end

  def find_suit
    case suit
    when 'H' then 'Hearts'
    when 'D' then 'Diamonds'
    when 'S' then 'Spades'
    when 'C' then 'Clover'
    end
  end
end

class Deck
  attr_accessor :cards

  def initialize
      @cards = []
      ['H', 'D', 'S', 'C'].each do |suit|
        ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K'].each do |face_value|
        @cards << Card.new(suit, face_value)
        end
      end
      scramble!
  end

  def scramble!
    cards.shuffle!
  end
<<<<<<< HEAD

=======
>>>>>>> 225546c228c0a10009dea3e9f6d3ad4549a9e532
  def deal_one
    cards.pop
  end
end

module Hand
  def show_hand
    cards.each do |card|
<<<<<<< HEAD
      puts "=> #{card}"
=======
      puts card
>>>>>>> 225546c228c0a10009dea3e9f6d3ad4549a9e532
    end
  end

  def total
    face_values = cards.map {|card| card.face_value}

    total = 0
    face_values.each do |val|
      if val == 'A'
        total += 11
      else
        total += (val.to_i == 0 ? 10: val)
      end
    end

    face_values.select {|val| val == 'A'}.count.times do
      total -= 10 if total > 21
    end

    total
  end

  def add_one(new_card)
    cards << new_card
  end
<<<<<<< HEAD

  def is_busted?
    total > Blackjack::BLACKJACK_AMOUNT
  end
=======
>>>>>>> 225546c228c0a10009dea3e9f6d3ad4549a9e532
end

class Player
  include Hand

  attr_accessor :name, :cards

  def initialize(name)
    @name = name
    @cards = []
  end
<<<<<<< HEAD

  def show_flop
    puts ""
    puts "----#{name}'s hand is----"
    show_hand
  end
=======
>>>>>>> 225546c228c0a10009dea3e9f6d3ad4549a9e532
end

class Dealer
  include Hand

  attr_accessor :name, :cards

  def initialize
    @name = "Dealer"
    @cards = []
  end
<<<<<<< HEAD

  def show_flop
    puts ""
    puts "----Dealer's hand is----"
    puts "=>First card is hidden"
    puts "=>#{cards[1]}"
    puts ""
  end
end

class Blackjack
  attr_accessor :deck, :player, :dealer

  BLACKJACK_AMOUNT = 21
  DEALER_HIT_LIMIT = 17

  def initialize
    @deck = Deck.new
    @player = Player.new("Player1")
    @dealer = Dealer.new
  end

  def obtain_name
    puts "What is your name?"
    player.name = gets.chomp
    puts "Nice to meet you, #{player.name}. Let's play!"
  end

  def deal_cards
    player.add_one(deck.deal_one)
    dealer.add_one(deck.deal_one)
    player.add_one(deck.deal_one)
    dealer.add_one(deck.deal_one)
  end

  def show_cards
    player.show_flop
    dealer.show_flop
  end

  def blackjack_or_bust?(player_or_dealer)
    if player_or_dealer.total == BLACKJACK_AMOUNT
      if player_or_dealer.is_a?(Player)
        puts "Congratulations, #{player.name} has hit blackjack!"
      else
        puts "Sorry, Dealer has hit blackjack. You lose"
      end
      play_again
    elsif player_or_dealer.is_busted?
      if player_or_dealer.is_a?(Player)
        puts "Sorry, #{player.name} has busted"
      else
        puts "Yay, Dealer has busted"
      end
      play_again
    end
  end

  def player_turn
    puts "It is #{player.name}'s turn"

    blackjack_or_bust?(player)

    while !player.is_busted?
      puts "#{player.name}, Would you like to hit or stay? 1) hit 2) stay"
      response = gets.chomp
      if !["1","2"].include?(response)
        puts "Invalid entry - Try again"
        next
      end

      if response == "1"
        puts "#{player.name} decided to hit"
        puts "Dealing one more card to #{player.name}"
        player.add_one(deck.deal_one)
        player.show_flop
        puts "=> #{player.name}'s total is #{player.total}"
      else
        puts "#{player.name} decided to stay at #{player.total}"
        break
      end
    end
    blackjack_or_bust?(player)
  end

  def dealer_turn
    blackjack_or_bust?(dealer)

    while dealer.total < DEALER_HIT_LIMIT
      puts "Dealing one more card to Dealer"
      dealer.add_one(deck.deal_one)
      puts ""
      puts "----Dealer's hand is----"
      dealer.show_hand
      puts "=> Dealer's total is #{dealer.total}"
    end
    blackjack_or_bust?(dealer)
  end

  def who_won?
    if dealer.total > player.total
      puts ""
      puts "Sorry, Dealer wins"
    elsif dealer.total < player.total
      puts ""
      puts "Yay, #{player.name} wins"
    else
      puts ""
      puts "It's a tie"
    end
  end

  def play_again
    puts "Would you like to play again? (Y/N)"
    response = gets.chomp.upcase

    if response == "Y"
      deck = Deck.new
      player.cards = []
      dealer.cards = []
      start
    else
      puts "Goodbye"
      exit
    end
  end

  def start
      obtain_name
      deal_cards
      show_cards
      player_turn
      dealer_turn
      who_won?
      play_again
  end
end

blackjack = Blackjack.new
blackjack.start
=======
end

class Game
attr_accessor :player, :dealer, :deck

  def initialize
    @player = Player.new("Joe")
    @dealer = Dealer.new
    @deck = Deck.new.scramble!
  end

  def deal_cards
    2.times do player.add_one(deck.deal_one) end
    2.times do dealer.add_one(deck.deal_one) end
  end

  def compare_hands


  end

  def check_for_blackjack
    if player.total == 21 && dealer.total == 21
      puts "Both parties have blackjack (WOW!)- it's a tie"
    elsif player.total == 21
      puts "Player has blackjack - Wins"
    elsif dealer.total == 21
      puts "dealer has blackjack"
    else
      nil
    end
  end

  def player_round
        puts "Woud you like to hit or stay? (Y/N)"
        p_response = gets.chomp.upcase
        if p_response == 'Y'
          player.add_one(deck.deal_one)
          player.total
          if player.total == 21
            puts "You hit blackjack - Wins"
          elsif player_total < 21
            player_round
          else
            puts "Player has busted - Loses"
          end
        elsif p_response == 'N'
          player.total
        else
          puts "You need to enter either \"Y\" or \"N\""
        end
  end

  def dealer_round

  end


  def announce_winner

  end

  def play
    begin
      deal_cards
      check_for_blackjack
      if check_for_blackjack
        nil
      else
        player_round
        dealer_round
        compare_hands
      end
      #no blackjack then player decides whether to take another card
      #player keeps on till stay or bust
      #dealer keeps hitting until the total reaches 17 or abov or bust
      #if both dealer and player are alive, the winner is announced
      puts "Would you like to play again: (Y/N)?"
  		play_again = gets.chomp.upcase
    end until play_again == 'N'
  end
end

Game.new.play
>>>>>>> 225546c228c0a10009dea3e9f6d3ad4549a9e532

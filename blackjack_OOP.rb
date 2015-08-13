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
  def deal_one
    cards.pop
  end
end

module Hand
  def show_hand
    cards.each do |card|
      puts card
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
end

class Player
  include Hand

  attr_accessor :name, :cards

  def initialize(name)
    @name = name
    @cards = []
  end
end

class Dealer
  include Hand

  attr_accessor :name, :cards

  def initialize
    @name = "Dealer"
    @cards = []
  end
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

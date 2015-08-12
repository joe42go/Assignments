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
  attr_accessor

  def initialize
    player = Player.new("Joe")
    dealer = Dealer.new
    deck = Deck.new
  end

  def deal_cards

  end

  def compare_hands (player, dealer)
    player.total 

  end

  def announce_winner
    if player.total == 21
      puts "Player has blackjack - Wins"
    elsif dealer.total == 21

  end

  def play
    begin
      #deck is created
      #two cards are dealt to each player and dealer
      #check for blackjack for both dealer and player 
      #whoever has blackjack is immediately announced as winner
      #no blackjack then player decides whether to take another card
      #player keeps on till stay or bust
      #dealer keeps hitting until the total reaches 17 or abov or bust
      #if both dealer and player are alive, the winner is announced
      #asked whether the player wants to keep on playing
    end until 
  end

end


Game.new.play

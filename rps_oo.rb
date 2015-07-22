class Player
  attr_accessor :choice
  attr_reader :hand, :name

  def initialize(n)
    @name = n
  end
end

class Human < Player

  def human_shoot
    begin
        puts "Pick one: (p,r,s)"
        self.choice = gets.chomp.downcase
    end until Game::CHOICES.keys.include?(self.choice)
  end
end

class Robot < Player

  def robot_shoot
    self.choice = Game::CHOICES.keys.sample
  end
end


class Game
  CHOICES = {"p" => "Paper", "r" => "Rock", "s" => "Scissors"}

  attr_reader :human, :robot

  def initialize
    @human = Human.new("Joe")
    @robot = Robot.new("R2D2")
  end

  def game_start
    system "cls"
    puts "Welcome to Paper, Rock, Scissors!"
  end

  def announce_winner(winning_hand)
    case winning_hand
    when 'r'
      puts "Rock breaks scissors!"
    when 'p'
      puts "Paper swallows rock"
    when 's'
      puts "Scissor halves the paper"
    end
  end

  def compare_hands
    if self.human.choice == self.robot.choice
      puts "\nEh, It's a tie"
    elsif (self.human.choice == "p" && self.robot.choice == "r") || (self.human.choice == "r" && self.robot.choice == "s") || (self.human.choice == "s" && self.robot.choice == "p")
      puts "You chose #{CHOICES[self.human.choice]} and Robot chose #{CHOICES[self.robot.choice]}"
      announce_winner(self.human.choice)
      puts "\nYou won!"
    else
      puts "You chose #{CHOICES[self.human.choice]} and Robot chose #{CHOICES[self.robot.choice]}"
      announce_winner(self.robot.choice)
      puts "\nComputer won!"
    end
  end

  def replay
    puts "Play again? (y/n)"
    play_again_choice = gets.chomp.downcase

    if play_again_choice == 'y'
      Game.new.play
    else
      puts "It's been real! Goodbye~"
    end
  end

  def play
    game_start
    human.human_shoot
    robot.robot_shoot
    compare_hands
    replay
  end
end

Game.new.play

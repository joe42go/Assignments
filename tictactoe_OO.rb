class Board
  WINNING_LINES = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

  def initialize
    @data = {}
    (1..9).each {|position| @data[position] = Square.new(' ')}
  end

  def draw
    system 'cls'
    puts "#{@data[1]}|#{@data[2]}|#{@data[3]}"
    puts "-----"
    puts "#{@data[4]}|#{@data[5]}|#{@data[6]}"
    puts "-----"
    puts "#{@data[7]}|#{@data[8]}|#{@data[9]}"
  end

  def empty_squares
    @data.select {|key, square| square.value == ' ' }.keys
  end

  def all_occupied?
    empty_squares.size == 0
  end

  def mark_square(position, marker)
    @data[position].mark(marker)
  end

  def check_winner(marker)
    WINNING_LINES.each do |line|
      return true if @data[line[0]].value == marker && @data[line[1]].value == marker && @data[line[2]].value == marker
    end
    false
  end
end

class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

class Square
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def mark(marker)
    @value = marker
  end

  def to_s
    @value
  end
end

class Game
  def initialize
    @board = Board.new
    @human_player = Player.new("Joe","X")
    @computer_player = Player.new("R2D2", "O")
    @current_player = @human_player
  end

  def current_player_marks_square
    if @current_player == @human_player
      begin
      puts "Player, Choose an empty square from #{@board.empty_squares}"
      player_position = gets.chomp.to_i
      end until @board.empty_squares.include?(player_position)
    else
      player_position = @board.empty_squares.sample
    end
    @board.mark_square(player_position, @current_player.marker)
  end

  def alternate_player
    if @current_player == @human_player
      @current_player = @computer_player
    else
      @current_player = @human_player
    end
  end

  def current_player_wins?
    @board.check_winner(@current_player.marker)
  end

  def play
    @board.draw
    loop do
      current_player_marks_square
      @board.draw
      if current_player_wins?
        puts "#{@current_player.name} wins!"
        break
      elsif @board.all_occupied?
        puts "It's a tie"
        break
      else
        alternate_player
      end
    end
    puts "Bye"
  end
end

Game.new.play

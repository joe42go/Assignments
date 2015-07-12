#Need to create a 3x3 board
#player choose
#computer chooses
#The game keeps going until there is either a winner (3 in a row) or all the spaces are filled up --> tie


def initialize_board
  b = {}
  (1..9).each {|position| b[position] = " "}
  b
end

def draw_board (b)
  system 'cls'
  puts "#{b[1]}|#{b[2]}|#{b[3]} "
  puts "-------"
  puts "#{b[4]}|#{b[5]}|#{b[6]} "
  puts "-------"
  puts "#{b[7]}|#{b[8]}|#{b[9]} "
end

def player_input(b)
  puts "Player, Choose an empty square from 1-9"
  player_position = gets.chomp.to_i
  b[player_position] = "X"
end

def empty_position(b)
  b.select {|k,v| v == " "}.keys
end

def computer_input(b)
  computer_position = empty_position(b).sample
  b[computer_position] = "O"
end

def check_winner(b)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    #return "Player" if b.select {|k,v| v == "X"}.keys == line
    return "Player" if b[line[0]] == "X" && b[line[1]] == "X" && b[line[2]] == "X"
    return "Computer" if b[line[0]] == "O" && b[line[1]] == "O" && b[line[2]] == "O"
  end
  nil
end

def announce_winner(winner)
  puts "#{winner} won!"
end

board = initialize_board
draw_board(board)

begin
    player_input(board)
    computer_input(board)
    draw_board(board)
    winner = check_winner(board)
end until  winner || empty_position(board).empty?
if winner
   announce_winner(winner)
else
  puts "It's a tie"
end

CHOICES = {"p" => "Paper", "r" => "Rock", "s" => "Scissors"}

puts "Welcome to Paper, Rock, Scissors!"

loop do
  begin
    puts "Pick one: (p,r,s)"
    player_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(player_choice)

  computer_choice = CHOICES.keys.sample
  if player_choice == computer_choice
    puts "It's a tie"
  elsif (player_choice == "p" && computer_choice == "r") || (player_choice == "r" && computer_choice == "s") || (player_choice == "s" && computer_choice == "p")
    puts "You won! You chose #{CHOICES[player_choice]} and the computer chose #{CHOICES[computer_choice]} "
  else
    puts "Computer won! You chose #{CHOICES[player_choice]} and the computer chose #{CHOICES[computer_choice]}"
  end

  puts "Play again? (y/n)"
  break if gets.chomp.downcase != "y"

end

puts "Good bye!"

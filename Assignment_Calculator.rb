puts "What is your first number?"
num1 = gets.chomp
puts "What is your second number"
num2 = gets.chomp
puts "What would you like to do: 1) Add 2) Subtract 3) Divde 4) Multiply?"
choice = gets.chomp

case choice.to_i
when 1
  puts num1.to_i + num2.to_i
when 2
  puts num1.to_i - num2.to_i
when 3
  puts num1.to_f / num2.to_f
when 4
  puts num1.to_i * num2.to_i
else
  puts "The calculator does not recognize that command"
end

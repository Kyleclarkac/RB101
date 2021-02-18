# This is a basic calculator that will ask for two inputs and an opperator and return the result

loop do
  puts "Please enter the first number"
  first_num = gets.chomp.to_f

  puts "Please enter the second number"
  second_num = gets.chomp.to_f

  puts "Please enter the opperation you would like performed (+,-,*,/)"
  opp =  gets.chomp


  case opp
  when "+"
    puts first_num + second_num
  when "-"
    puts first_num - second_num
  when "*"
    puts first_num * second_num
  when "/"
    puts first_num / second_num
  end
end
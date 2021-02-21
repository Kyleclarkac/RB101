#This is a basic calculator that will ask for two inputs and an opperator and return the result


require 'yaml'
MESSAGES = YAML.load_file('/Users/kquasimoto/Documents/LaunchSchool/RB101/Lesson_2/calculator_messages.yml')

puts MESSAGES.inspect

puts MESSAGES["welcome"]
puts "Please enter your name so I can creepily refer to you"
name = gets.chomp
num_chars = "0123456789.,"
loop do
  
  first_num = nil
  loop do
    valid = true
    puts 'Please enter the first number'
    first_input = gets.chomp
    first_input.each_char do |char|
      if !num_chars.include?(char)
        valid = false
      end
    end
    first_num = first_input.to_f
    break if valid
    puts "That doesn't look right. Please enter a number only containing '1234567890,.'"
  end
  

  second_num = nil
  loop do
    valid = true
    puts 'Please enter the second number'
    second_input = gets.chomp
    second_input.each_char do |char|
      if !num_chars.include?(char)
        valid = false
      end
    end
    second_num = second_input.to_f
    break if valid
    puts "That doesn't look right. Please enter a number only containing '1234567890,.'"
  end

  puts 'Please enter the opperation you would like performed (+,-,*,/)'
  opp = gets.chomp

  case opp
  when '+'
    puts first_num + second_num
  when '-'
    puts first_num - second_num
  when '*'
    puts first_num * second_num
  when '/'
    puts first_num / second_num
  end

  puts "Would you like to make another calculation? (y/n)"
  repeat = gets.chomp
  break if repeat != "y"
end

puts "Goodby #{name}! Thanks for using the calculator!"

def teddy_age(name = 'Teddy')
  puts "#{name} is #{rand(20..200)} years old"
end

teddy_age('linda')

# def area 
#   puts 'Enter the length of the room in meters'
#   length = gets.chomp.to_i
#   puts 'Enter the width in meters'
#   width = gets.chomp.to_i
#   square_meters = length*width
#   square_feet = square_meters * 10.76
#   puts "The area is #{square_meters} square meters or #{square_feet} square feet"
# end

# area()

def tipper(bill, rate)
  tip_amount = bill * rate/100.0
end

puts tipper(112, 18)

puts Time.now.day

def greeting(name)
  name[-1] == '!' ? puts("HELLO #{name.upcase.chomp('!')} WHY ARE WE SCREAMING?") : puts("Hello #{name.capitalize}.")
end

greeting('kyle')

(1..10).each { |num| puts num if num.even? && !num.zero?}

def product_or_sum(num, opp)
  opp == 'p' ? puts((1..num).reduce(1){|sum, num| sum * num}) : puts((1..num).sum)
end

product_or_sum(5, 's')
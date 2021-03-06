def valid_float(string)

  return v_float
end

# This program will take in three inputs from a user and display mortgage data

puts "Hello! Welcome to the Mortgage Calculator. Let's see what you'll be paying"
puts
#Get inputs from user for Loan amount, apr, and duration.

loop do
  puts "Please enter the total loan amount in dollars"
  amount = gets.chomp.to_f
  break if amount.to_s.to_f

puts "Please enter the APR as a percent"
monthly_interest = gets.chomp.to_f/(12*100)

puts "Please enter the load duration in years"
duration = gets.chomp.to_f*12

monthly_payment = amount * (monthly_interest / (1 - (1 + monthly_interest)**(-duration)))


puts "Your month payment will be #{monthly_payment}"
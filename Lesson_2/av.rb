# def valid_float(string)

#   return v_float
# end

# sum = 0
# 20.times do |x|
#   sum += (20.0/(x+1))
# end

# puts "The calculated average number of rolls is #{sum} rolls"

# total_rolls = 0
# trial_count = 0
# trials = 10000
# while trial_count < trials
#   full_set = []
#   var = nil 
#   count = 0
#   while full_set.length < 20
#     var = rand(1..20)
#     count +=1
#     full_set << var
#     full_set.uniq!
#   end
#   total_rolls += count
#   trial_count +=1
# end

# puts "In #{trials} trials it averaged #{total_rolls} / #{trial_count} or #{format('%.2f', (total_rolls.to_f/trial_count))} rolls"

# puts format('%.2f', (total_rolls.to_f/trial_count))




def name
  "George"
end

name = "Lisa"
loop do
  puts name
  break
end
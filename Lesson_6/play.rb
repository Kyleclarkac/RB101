# frozen_string_literal: true

def reverse_words(str)
  new_string = []
  str.split.each do |word|
    new_string << if word.length > 4
                    word.reverse
                  else
                    word
                  end
  end
  new_string.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

def stringy(int)
  string = ''
  int.times do |num| 
    string += num.even? ? '1' : '0'
  end
  string
end



puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

def average(arr)
  a = arr.sum.to_f/arr.length
  puts a 
  a
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

arr = [1,2,3,4]
puts arr.reduce{|sum, num| sum - num}
def sum(int)
  int.to_s.split('').map{ |num| num.to_i}.sum
end


puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

def calculate_bonus(salary, bool)
  bool ? salary/2 : 0
end


puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
def sum_square_difference(num)
  sum(num)**2 - square_sum(num)
end

def square_sum(num)
  sum = 0 
  1.upto(num) {|int| sum += int*int}
  sum
end

def sum(num)
  sum = 0 
  1.upto(num) {|int| sum += int}
  sum
end



p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
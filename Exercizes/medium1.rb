def rotate_array(arr)
  rotated = arr.map{|num| num}
  rotated.push(rotated.shift)
end

test = [1, 2, 3, 4]

p rotate_array(test)
p test

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

def rotate_rightmost_digits(num, spin)
  rotate = num.dup
  array = rotate.to_s.chars
  array.push(array.delete_at(-spin)).join.to_i
end

num = 1234

p rotate_rightmost_digits(num, 2)
p num

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

def max_rotation(int)
  rotated = int
  length = int.to_s.length
  count = -length
  loop do 
    rotated = rotate_rightmost_digits(rotated, -count)
    count +=1
    break if count == 0
  end
  rotated
end

puts "the final one works if this is follow by five trues"
puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
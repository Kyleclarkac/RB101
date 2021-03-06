
def transpose(arr)
  new_matrix = []
  
  arr[0].size.times do |collumn|  
    new_row = []  
    arr.each do |row|
      new_row << row[collumn]
    end
    new_matrix << new_row
  end
  new_matrix
end

def transpose!(arr)
  new_matrix = arr.dup
  
  arr.size.times do |collumn|  
    new_row = []  
    new_matrix.each do |row|
      new_row << row[collumn]
    end
    arr[collumn] = new_row
  end
  arr
end






matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

p transpose!(matrix)
p matrix

puts "mXn"

p transpose([[1, 2, 3, 4]]) #== [[1], [2], [3], [4]]
puts transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
puts transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
puts transpose([[1]]) == [[1]]
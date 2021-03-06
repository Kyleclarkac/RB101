arr = ['10', '11', '9', '7', '8']

new_arr = arr.sort do |a,b|
  b.to_i <=> a.to_i
end

p new_arr


# => ["11", "10", "9", "8", "7"]

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

sorted_books = books.sort_by do |a|
  a[:published]
end

p sorted_books


arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
puts arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
puts arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
puts arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
puts hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
puts hsh2[:third].keys[0]


arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
p arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] =4
p arr2

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
p hsh1 

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
p hsh2


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

combined_age = 0
munsters.each do |k,v|
  if munsters[k]["gender"] == "male"
    combined_age += munsters[k]["age"]
  end
end

puts combined_age

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, person|
  puts "#{name} is a #{person["age"]} year old #{person["gender"]}."
end


hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |words|
  words.each do |word|
    word.each_char do |char|
      if "AEIOUaeiou".include?(char)
        puts char
      end
    end
  end
end


arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted = arr.map do |sub_array|
  sub_array.sort
end

p sorted

arr11 = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

inc_arr = arr11.map do |hash|
  inc_hash = {}
  hash.each do |key,value|
    inc_hash[key] = value +=1
  end
  inc_hash
end

p inc_arr

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

new_arr = arr.map do |sub_arr|
  sub_arr.select{|num| num%3 == 0}
end

p new_arr

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

new_hash = {}

arr.each do |ele|
  new_hash[ele[0]]= ele[1]
end

p new_hash

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

sorted =  arr.sort_by do |ele|
    ele.select{|num| num.odd?}
  end

p sorted

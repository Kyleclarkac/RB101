#find the starting element for the row. 
  #that will be 2 times the number of elements that have proceeded that row
    #that will be the sum of all intergers greater than zero but less that the row number. for example row four would have  3+2+1 = 6 elements preceding it. 
#Then add to that starting intger all the remaining integers in that row. 
  #each of them will be the starting integer plus 2 times the index in the row

def sum_evens_in_structure(int)
  sum = 0 
  starting_element = ((int-1)*((int-1) +1)) + 2
  int.times {|index| sum += starting_element + (2*index)}
  return sum
end

sum_evens_in_structure(2)


produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}


def select_fruit(hash)
  fruits = {}
  hash.each do |k,v| 
    if v == "Fruit" 
      fruits[k] = v
    end
  end
  fruits
end

puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

def double_numbers(numbers)
  
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] *=2

    counter += 1
  end
end




my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]

puts my_numbers


flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash1 = {}
flintstones.each.with_index do |name, idx, hash|
  hash1[name] = idx
end

p hash1

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

total_ages = 0
ages.each{|k,v| total_ages += v}
puts total_ages

puts ages.values.sort.first

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.find_index{|word| word[0..1] == 'Be'}

p flintstones.map{|name| name = name[0..2]}

statement = "The Flintstones Rock"
p statement.split('').count('F')

new_hash = {}
statement.split('').each do |char|
  new_hash[char] = statement.count(char)
end

p new_hash  

words = "the flintstones rock"

puts words.split.map{|word| word.capitalize}.join(" ")

puts words


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |k,v|
  if v["age"] < 18
    v["age_group"] = "kid"
  elsif v["age"] > 64
    v["age_group"] = "senior"
  else
    v["age_group"] = "adult"
  end
end

munsters.map{|k,v| v['age'] +=3}
p munsters

p [1,2,3].select{|num| num > 2}

['a', 'b', 'c'].select do |item|
  puts item
end

countries_and_capitals = {
  'France' => 'Paris',
  'Belgium' => 'Brussels',
  'Morocco' => 'Rabat',
  'Barbados' => 'Bridgetown',
  'Peru' => 'Lima',
  'Bolivia' => 'La Paz',
  'Brazil' => 'Brasilia'
}


w = countries_and_capitals.select { |_, country| country[0] == 'B' }

p w
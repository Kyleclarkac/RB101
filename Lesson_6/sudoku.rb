
#simplest possible
# Input all given digits and initialize hash with all possibilities. 
# sort hash by least possibilities.
# make guess on first element of the sorted array and remove affected possibilites
# if any remaining have zero possibilites then change guess
# if no guesses remain. 
    #Reset possibilities for this item, 
    #add back to the possible list
    #remove from the guess list
    #if guess list.empty? "There are no solutions."
    #change preivous guess
#if guess list.size == 81 you solved it
#loop back to 6 until solved

# Input template:
# input = [
#   0,0,0,  0,0,0,  0,0,0,
#   0,0,0,  0,0,60,  0,0,0,
#   0,0,0,  0,0,0,  0,0,0,

#   0,0,0,  0,0,0,  0,0,0,
#   0,0,0,  0,0,0,  0,0,0,
#   0,0,0,  0,0,4,  0,0,0,

#   0,0,0,  0,0,0,  0,0,0,
#   0,0,0,  0,0,0,  0,0,0,
#   0,0,0,  0,0,0,  0,0,0,
# ]

input = [
  0,3,0,  0,0,2,  0,6,4,
  8,0,0,  0,0,0,  0,0,3,
  0,7,0,  0,8,3,  0,0,2,

  0,0,0,  0,0,4,  0,0,0,
  0,0,2,  0,1,6,  0,8,0,
  0,9,0,  2,3,0,  0,0,0,

  0,6,0,  0,0,0,  5,0,8,
  0,0,0,  0,6,9,  0,4,0,
  0,0,0,  4,0,0,  1,0,0,
]

# Input all given digits and initialize hash with all possibilities. 
def add_input(input, unsolved_list, guess_list)
  input.each.with_index do |number, index|
    box = get_box(index)
    if number == 0
      unsolved_list << {index: index, row: (index/9 + 1), column: (index%9 + 1), box: box, number: nil, possibilities: [1,2,3,4,5,6,7,8,9]}
    else
      guess_list << {index: index, row: (index/9 + 1), column: (index%9 + 1), box: box, number: number, possibilities: []}
    end
  end
end

def get_box(index)
  case 
  when [0, 1, 2, 9, 10, 11, 18, 19, 20].include?(index)
    1
  when [3, 4, 5, 12, 13, 14, 21, 22, 23].include?(index)
    2
  when [6, 7, 8, 15, 16, 17, 24, 25, 26].include?(index)
    3
  when [27, 28, 29, 36, 37, 38, 45, 46, 47].include?(index)
    4
  when [30, 31, 32, 39, 40, 41, 48, 49, 50].include?(index)
    5
  when [33, 34, 35, 42, 43, 44, 51, 52, 53].include?(index)
    6
  when [54, 55, 56, 63, 64, 65, 72, 73, 74].include?(index)
    7
  when [57, 58, 59, 66, 67, 68, 75, 76, 77].include?(index)
    8
  when [60, 61, 62, 69, 70, 71, 78, 79, 80].include?(index)
    9
  end
end

def display_solution(list)
  puts 'Congrats there is a solution!'
  puts
  list.sort_by!{|cell| cell[:index]}
  count = 0 
  9.times do 
    arr = []
    bigarr = []
    9.times do
      arr << list[count][:number]
      count += 1
      if count%3 == 0
        bigarr << arr
        arr = []
      end
    end
    p bigarr
    if count%27  == 0
      puts
    end
  end
end

def init_cells(starting_cells, guesses, unresolved)
  starting_cells.each do |cell|
    unless cell[:number] == nil
      cell[:possibilities] = []
      guesses << cell
    else
      unresolved << cell
    end
  end
end

def sort_remaining!(list)
  list.sort_by! {|cell| cell[:possibilities].size }
end

def make_guess!(guesses, unresolved)
  guesses << unresolved.shift
  guesses[-1][:number] = guesses[-1][:possibilities].shift
end

def apply_constraints(guesses, unresolved)
  guesses.each do |filled_cell|
    unresolved.each do |empty_cell|
      if filled_cell[:row] == empty_cell[:row] || filled_cell[:column] == empty_cell[:column] || filled_cell[:box] == empty_cell[:box]
        empty_cell[:possibilities].delete(filled_cell[:number])
      end
    end
  end
end

def no_solutions?(unresolved)
  unresolved.any? { |cell| cell[:possibilities].empty?}
end

def possibilities_remain?(space)
  space[:possibilities].size > 0 
end

def change_current_guess(guesses)
  guesses[-1][:number] = guesses[-1][:possibilities].shift
end

def reset_possibilities(unresolved)
  unresolved.each {|cell| cell[:possibilities] = [1,2,3,4,5,6,7,8,9]}
end

def remove_current_guess(guesses, unresolved)
  unresolved.prepend(guesses.pop)
end

def backtrack(guesses, unresolved)
  if possibilities_remain?(guesses[-1])
    change_current_guess(guesses)
    reset_possibilities(unresolved)
    apply_constraints(guesses, unresolved)
  else
    remove_current_guess(guesses, unresolved)
    backtrack(guesses, unresolved) unless guesses.empty?
  end
end

def display_solution(list)
  puts 'Congrats there is a solution!'
  puts
  list.sort_by!{|cell| cell[:index]}
  count = 0 
  9.times do 
    arr = []
    bigarr = []
    9.times do
      arr << list[count][:number]
      count += 1
      if count%3 == 0
        bigarr << arr
        arr = []
      end
    end
    p bigarr
    if count%27  == 0
      puts
    end
  end
end
  

# Start of Program
# Apply the user input. 
guess_list = []
unsolved_list = []
add_input(input, unsolved_list, guess_list)
apply_constraints(guess_list, unsolved_list) 

loop do   
  sort_remaining!(unsolved_list)
  make_guess!(guess_list, unsolved_list)
  if unsolved_list.size == 0
    display_solution(guess_list)
    break
  end

  apply_constraints(guess_list, unsolved_list)
  if no_solutions?(unsolved_list)
    backtrack(guess_list, unsolved_list)
    if guess_list.empty?
      puts "There doesn't appear to be a solution."
      break
    end
  end
end




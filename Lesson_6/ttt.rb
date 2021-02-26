# frozen_string_literal: true

require 'rainbow'

COMPUTER_MARKER = 'O'
PLAYER_MARKER = 'X'
INIT_SPACE = ' '

WIN_CONDITIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
].freeze

def display_board(arr)
  puts "
     |   |
   #{arr[0]} | #{arr[1]} | #{arr[2]}
     |   |
  ---+---+---
     |   |
   #{arr[3]} | #{arr[4]} | #{arr[5]}
     |   |
  ---+---+---
     |   |
   #{arr[6]} | #{arr[7]} | #{arr[8]}
     |   |"
end

def move_options
  puts Rainbow('1|2|3').underline
  puts Rainbow('4|5|6').underline
  puts '7|8|9'
end

def welcome
  puts '---------------'
  puts
  puts 'Would you like to play a game...? A war game?'
end

def apply_user_move!(moves_arr)
  puts 'Please enter the number of the square you would like to play in. Based on the following table.'
  move_options
  loop do
    user_input = gets.chomp.to_i - 1
    if moves_arr[user_input] == INIT_SPACE
      moves_arr[user_input] = PLAYER_MARKER
      break
    end
    puts 'Looks like that spot is already taken. Choose another'
  end
end

def apply_computer_move!(moves_arr, hard_mode)
  return moves_arr unless moves_arr.include?(INIT_SPACE)

  if hard_mode == true
    moves_arr[best_move(moves_arr)] = COMPUTER_MARKER
  else
    moves_arr[random_move(moves_arr)] = COMPUTER_MARKER
  end
end

def random_move(moves_arr)
  loop do
    choice = [0, 1, 2, 3, 4, 5, 6, 7, 8].sample
    return choice if moves_arr[choice] == INIT_SPACE
  end
end

def win_now(arr)
  WIN_CONDITIONS.each do |win|
    temp_arr = []
    empty = nil

    win.each do |index|
      empty = index if arr[index] == INIT_SPACE
      temp_arr << arr[index]
    end
    return empty if temp_arr.count(COMPUTER_MARKER) == 2 && !empty.nil?
  end
  nil
end

def defense(arr)
  WIN_CONDITIONS.each do |win|
    temp_arr = []
    empty = nil

    win.each do |index|
      empty = index if arr[index] == INIT_SPACE
      temp_arr << arr[index]
    end

    return empty if temp_arr.count(PLAYER_MARKER) == 2 && !empty.nil?
  end
  nil
end

def empty_corner(arr)
  loop do
    corner = [0, 2, 6, 8].sample
    return corner if arr[corner] == INIT_SPACE
  end
end

def empty_orthagonal(arr)
  loop do
    corner = [1, 3, 7, 5].sample
    return corner if arr[corner] == INIT_SPACE
  end
end

def best_move(moves_arr)
  # If two out of three of a win condition are yours and the third is empty pick the third
  return win_now(moves_arr) unless win_now(moves_arr).nil?

  # Else if two out of three of a win condition are the same pick the third
  return defense(moves_arr) unless defense(moves_arr).nil?

  # Else if the middle is empty take the middle
  return 4 if moves_arr[4] == INIT_SPACE

  # Else if the middle is "O" take any open corner
  return empty_corner(moves_arr) if moves_arr[4] == PLAYER_MARKER

  # Else if the middle is "X" take any orthagonal space to the middle
  return empty_orthagonal(moves_arr) if moves_arr[4] == COMPUTER_MARKER
end

def check_endgame(moves_arr)
  WIN_CONDITIONS.each do |win|
    return 1 if moves_arr.values_at(win[0], win[1], win[2]).all? { |char| char == PLAYER_MARKER }
    return -1 if moves_arr.values_at(win[0], win[1], win[2]).all? { |char| char == COMPUTER_MARKER }
  end

  return 0 unless moves_arr.include?(INIT_SPACE)
end

def print_endgame_message(winner)
  puts 'Congrats! Won. You must have been playing easy mode...' if winner == 1
  puts 'You lost. That\'s embarrassing...' if winner == -1
  puts 'Tie game. As is expected.' if winner.zero?
end

# Main Loop
loop do
  welcome
  hard_mode = true
  puts
  puts 'Would you like to play in hard mode? (y/n)'
  hard_mode = gets.chomp == 'y'
  moves = [INIT_SPACE, INIT_SPACE, INIT_SPACE, INIT_SPACE, INIT_SPACE, INIT_SPACE, INIT_SPACE, INIT_SPACE, INIT_SPACE]

  display_board(moves)

  loop do
    apply_user_move!(moves)
    apply_computer_move!(moves, hard_mode)
    display_board(moves)
    endgame = check_endgame(moves)

    if endgame
      print_endgame_message(endgame)
      break
    end
  end

  puts 'Would you like to play again?(y/n)'
  input = gets.chomp
  break unless input == 'y'
end

# frozen_string_literal: true

VALID_CHOICES = %w[rock paper scissors lizard spock].freeze

def win?(first, second)
  (first == 'rock' && %w[scissors lizard].include?(second)) ||
    (first == 'paper' && %w[spock rock].include?(second)) ||
    (first == 'scissors' && %w[lizard paper].include?(second)) ||
    (first == 'lizard' && %w[spock paper].include?(second)) ||
    (first == 'spock' && %w[rock scissors].include?(second))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt('You win!')
  elsif player != computer
    prompt('You lost!')
  else
    prompt('Tie Game!')
  end
end

def prompt(message)
  puts("=> #{message}")
end

def valid?(string)
  VALID_CHOICES.include?(string.downcase)
end

def convert_input(string)
  return 'rock' if %w[r rock Rock R].include?(string)
  return 'paper' if %w[p paper pap Paper P].include?(string)
  return 'scissors' if %w[sc scissors Sc SC Scissors].include?(string)
  return 'lizard' if %w[l L Lizard lizard liz].include?(string)
  return 'spock' if %w[Sp sp Spock spock].include?(string)

  string
end

player_score = 0
computer_score = 0

loop do
  prompt('Choose Rock, Paper, Scissors, Lizard or Spock')
  choice = nil
  loop do
    choice = gets.chomp.downcase
    choice = convert_input(choice)
    break if valid?(choice)

    prompt("That's not a valid input. Please choose 'rock', 'paper' or 'scissors'.")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice} and the computer chose #{computer_choice}")

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, choice)
    computer_score += 1
  end

  prompt "The current score is: Player: #{player_score} and computer: #{computer_score}"

  if player_score >= 5
    prompt 'You are the grand winner'
    player_score = 0
    computer_score = 0
  elsif computer_score >= 5
    prompt 'The Computer is the Grand Winner!'
    player_score = 0
    computer_score = 0
  end

  prompt('Would you like to play again?(y/n)')
  break if gets.chomp.downcase != 'y'
end

prompt('Thanks for playing')

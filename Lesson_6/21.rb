# frozen_string_literal: true

# This program will play a simple version of Black Jack.
# It will create a standard deck of 52 cards
# It will 'deal' two cards each to the 'player' and the 'dealer'
# Only one of the 'dealers'' cards is viewable to the player
# The player will then be given the option to 'Hit' until they bust or stay.
# If the player busts they have lost
# The dealer will then reveal their card and hit until their total is at least 17 and higher than the players total.
# If the dealers total is greater than the player and they have not busted then they win
# 2-9 will have their face value. 10-king will be valued 10, and Ace is worth 1 or 11, whichever is better.

# Takes in three arrays and modifies them
def init_deal!(participant1, participant2, deck)
  2.times { participant1 << deck.delete(deck.sample) }
  2.times { participant2 << deck.delete(deck.sample) }
end

# Takes in two arrays and prints out the current status
def display_hand_status(player, dealer)
  cards_string_player = player.map { |ele| ele[0] }
  cards_string_dealer = dealer.map { |ele| ele[0] }
  puts "You currently have the #{cards_string_player.join(' and ')} and your score is: #{score_total(player)}"
  puts
  puts "The dealer has the #{cards_string_dealer[0]} and one other unknown card."
  puts
end

# Takes in two arrays and prints out the current status
def display_endgame_hands(player, dealer)
  cards_string_player = player.map { |ele| ele[0] }
  cards_string_dealer = dealer.map { |ele| ele[0] }
  puts "You had the #{cards_string_player.join(' and ')} and your score was: #{score_total(player)}"
  puts "The dealer had the #{cards_string_dealer.join(' and ')} and their score was: #{score_total(dealer)}"
  puts
end

# Takes in two arrays and modifies them
def deal_one!(player, deck)
  player << deck.delete(deck.sample)
end

# Takes in one array, converts it to and score and prints the score
def display_score(player, score)
  puts "You got the #{player[-1][0]} and your new score is: #{score}"
end

# Takes in one array of cards and converts it to a score.
def score_total(participant)
  score = 0
  sorted_cards = participant.sort_by { |card| card[0] }
  sorted_cards.reverse_each do |card|
    if card[0][0..2] == 'Ace' && score < BUST_CONDITION - 10
      score += 11
    elsif card[0][0..2] == 'Ace'
      score += 1
    else
      score += card[1]
    end
  end
  score
end

# Checks if a score is above 21 and returns a bool
def bust?(score)
  return true if score > BUST_CONDITION
end

# Asks the player for input and returns a bool.
def stay?
  acceptable_hit_inputs = %w[h hit Hit H Hitmebaby]
  acceptable_stay_inputs = %w[s S Stay stay]
  puts "Would you like to 'Stay' or 'Hit'?(s/h)"
  loop do
    input = gets.chomp
    return false if acceptable_hit_inputs.include?(input)
    return true if acceptable_stay_inputs.include?(input)

    puts "That's not an acceptabel input please input hit or stay"
  end
end

# Takes in two card arrays and returns a string either 'Player' or 'Dealer'
def who_won(pscore, dscore)
  if pscore > dscore && !bust?(pscore)
    'Player'
  elsif !bust?(pscore) && bust?(dscore)
    'Player'
  elsif pscore == dscore
    'Tie'
  else
    'Dealer'
  end
end

# Prints out the winner based on a string input
def display_winner(winner, money, bet)
  if winner == 'Player'
    puts "Congrats! You won! You beat the odds and won $#{bet}. You now have $#{money}"
  elsif winner == 'Dealer'
    puts 'You lost. The house won as they always will. Gambling is a tax on those who cannot do math'
    puts "You lost $#{bet} and now only have $#{money}."
  elsif winner == 'Tie'
    puts 'Tie game. This was a pointless excerize wasn\'t it'
  end
end

# Asks player for input and returns a bool
def play_again?
  acceptable_inputs = %w[y Y yes Yes YES YESPLEASE]
  puts 'Would you like to play again?(y/n)'
  input = gets.chomp
  return true if acceptable_inputs.include?(input)
end

def place_bet(cash)
  puts "You currently have $#{cash} dollars on hand. Please enter the bet you would like to place.
It must be at least $1 and must be entered as integer"
  input = ''
  loop do
    input = gets.chomp
    break if input == input.to_i.to_s && input.to_i <= cash && input.to_i.positive?

    puts "You can't bet that. You can only bet as much as you have. And must enter as an int"
  end
  input.to_i
end

def collection_time(winner, money, bet)
  return money + bet if winner == 'Player'
  return money - bet if winner == 'Dealer'
  return money if winner == 'Tie'
end

BUST_CONDITION = 21
DEALER_MIN = 17

FULL_DECK = [
  ['Two of Spades', 2],
  ['Two of Clubs', 2],
  ['Two of Hearts', 2],
  ['Two of Diamonds', 2],
  ['Three of Spades', 3],
  ['Three of Clubs', 3],
  ['Three of Hearts', 3],
  ['Three of Diamonds', 3],
  ['Four of Spades', 4],
  ['Four of Clubs', 4],
  ['Four of Hearts', 4],
  ['Four of Diamonds', 4],
  ['Five of Spades', 5],
  ['Five of Clubs', 5],
  ['Five of Hearts', 5],
  ['Five of Diamonds', 5],
  ['Six of Spades', 6],
  ['Six of Clubs', 6],
  ['Six of Hearts', 6],
  ['Six of Diamonds', 6],
  ['Seven of Spades', 7],
  ['Seven of Clubs', 7],
  ['Seven of Hearts', 7],
  ['Seven of Diamonds', 7],
  ['Eight of Spades', 8],
  ['Eight of Clubs', 8],
  ['Eight of Hearts', 8],
  ['Eight of Diamonds', 8],
  ['Nine of Spades', 9],
  ['Nine of Clubs', 9],
  ['Nine of Hearts', 9],
  ['Nine of Diamonds', 9],
  ['Ten of Spades', 10],
  ['Ten of Clubs', 10],
  ['Ten of Hearts', 10],
  ['Ten of Diamonds', 10],
  ['Jack of Spades', 10],
  ['Jack of Clubs', 10],
  ['Jack of Hearts', 10],
  ['Jack of Diamonds', 10],
  ['Queen of Spades', 10],
  ['Queen of Clubs', 10],
  ['Queen of Hearts', 10],
  ['Queen of Diamonds', 10],
  ['King of Spades', 10],
  ['King of Clubs', 10],
  ['King of Hearts', 10],
  ['King of Diamonds', 10],
  ['Ace of Spades', 10],
  ['Ace of Clubs', 10],
  ['Ace of Hearts', 10],
  ['Ace of Diamonds', 10]
]

WELCOME_MESSAGE = "
Welcome to the 21 game! The idea is to get a score of 21 without going over.
  1.  At the beginning of the game you and the dealer will each recieve two cards.
  2.  You will then be given the option to hit. Hitting means adding another card to your hand.
  3.  You can continue to hit until you bust or decide to stay.
  4.  You bust if your score is over 21.
  5.  If you bust you immediately lose regardless of the dealers cards.
  6.  Your score is the cumulative value of the cards in your hand.
  7.  Cards 2-10 have their face value and Jack through King are all worth 10.
  8.  Aces can be worth either 1 or 11 depending on what is better for you.
  9.  If you don't bust the dealer will then hit until they get higher than both 17 and your score, or they bust.
  10. If neither the dealer nor the player busts then the higher score wins.
_____________________
That's it! Good luck!
---------------------
"

puts WELCOME_MESSAGE
money = 100
# Main Game Loop
loop do
  # 1. Deal cards to the player and dealer
  bet = place_bet(money)
  deck = FULL_DECK
  player = []
  dealer = []

  init_deal!(player, dealer, deck)
  puts '_______________________________________'
  puts
  display_hand_status(player, dealer)

  player_score = score_total(player)
  dealer_score = score_total(dealer)

  # 2. Allow the player to "hit" or "Stay
  loop do
    break if bust?(player_score) || stay? # Break if the player chooses to "Stay" or if they bust.

    deal_one!(player, deck)
    player_score = score_total(player)
    display_score(player, player_score)
    puts 'You Busted!!!' if bust?(player_score)
  end

  # 3. Allow the computer to "hit" or "stay"
  until bust?(player_score)
    break unless (dealer_score < player_score || dealer_score < DEALER_MIN) && !bust?(dealer_score)

    deal_one!(dealer, deck)
    dealer_score = score_total(dealer)
  end

  # 4. Compare scores. The higher one wins
  puts
  puts 'The final hands are:'
  display_endgame_hands(player, dealer)
  puts
  money = collection_time(who_won(player_score, dealer_score), money, bet)
  display_winner(who_won(player_score, dealer_score), money, bet)
  puts
  break unless play_again?
end
puts
puts 'Thanks for playing. Come back soon!'

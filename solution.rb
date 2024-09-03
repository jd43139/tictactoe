choices = [1, 2, 3, 4, 5, 6, 7, 8, 9]

class Player
  attr_accessor :choices

  def initialize
    @choices = []
  end

  def add_to_choices(choice)
    @choices << choice
  end

  def win?(choices)
    winning_patterns = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    winning_patterns.each do |pattern|
      if choices.filter { |n| pattern.include?(n) }.sort == pattern
        return true
      end 
    end
  end

end
player1 = Player.new
player2 = Player.new

def manage_choice_player_x(choices, choice)
  if choices.include?(choice) && choice.instance_of?(Integer)
    choices[choice - 1] = 'X'
  else
    false
  end
end

def display_board(choices)
  row1 = choices[0..2].join('|')
  row2 = choices[3..5].join('|')
  row3 = choices[6..8].join('|')
  board = "#{row1}\n#{row2}\n#{row3}"
  puts board
end

def manage_choice_player_o(choices,choice)
  if choices.include?(choice) && choice.instance_of?(Integer)
    choices[choice - 1] = 'O'
  else
    false
  end
end

while true
  puts 'Choose a number => Player_X: '
  display_board(choices)
  player1_choice = gets.chomp.to_i
  until choices.include?(player1_choice)
    puts "Unvalid number or the number is already chosen\n"
    puts 'Choose a number => Player_X: '
    display_board(choices)
    player1_choice = gets.chomp.to_i

  end
  manage_choice_player_x(choices, player1_choice)
  player1.add_to_choices(player1_choice)
  sleep 0.25
  display_board(choices)
  if choices.all? { |c| c.instance_of?(String) }
    puts 'Tie!'
    break
  end
  if player1.win?(player1.choices) == true
    puts 'player_X is the winner!'
    break
  end
  
  puts 'Choose a number => Player_O: '
  player2_choice = gets.chomp.to_i
  until choices.include?(player2_choice)
    puts "Unvalid number or the number is already chosen\n"
    puts 'Choose a number => Player_O: '
    display_board(choices)
    player2_choice = gets.chomp.to_i
  end
  manage_choice_player_o(choices, player2_choice)
  player2.add_to_choices(player2_choice)
  sleep 0.25
  display_board(choices)
  if player2.win?(player2.choices) == true
    puts 'Player_O is the winner!'
    break
  end
  
end

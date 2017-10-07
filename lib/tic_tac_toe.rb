class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

def play
  until over? == true
    turn
  end
  if won? != false
    win_char = winner
    puts "Congratulations #{win_char}!"
  else draw? == true
    puts "Cat's Game!"
  end
end

def display_board #done for now
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input) #conver input move to board array index
  user_input.to_i - 1
end

def position_taken?(index) #is there already a X/O
  if @board[index] == "X" || @board[index] == "O"
    true
  elsif @board[index] == " " || @board[index] == "" || @board[index] == nil
    false
  end
end

def valid_move?(index) #can't make move to occupied space
    if index.between?(0, 8) && (position_taken?(index) == false)
      true
    elsif (index.between?(0,8) == false) || (position_taken?(index) == true)
      false
    end
end

def turn #cycles to put valid user move into [board]
  puts "Please enter 1-9:"
  user_input = gets.strip
  user_char = current_player #zigzags X/O based on X goes first
  index = input_to_index(user_input)
  if valid_move?(index) #don't know about this board, need to move valid_move + move to get rid of board passthru
    move(index, user_char)
  else turn #restarts turn if invalid move
  end
  display_board
end

def move(index, user_char) #put X/O in the appropriate space
  @board[index] = user_char
end

def turn_count #counts already made moves
  turns=0
  @board.each do |board_space|
    if board_space == "O" || board_space == "X"
      turns +=1
    end
  end
  turns
end

#Converts even/odd number of board elements to whose turn it is
def current_player
  if (turn_count % 2) == 0
    player = "X"
  elsif (turn_count % 2) != 0
    player = "O"
  end
end

def won? #returns FALSE OR winning line array (called by #winner)
  any_return = WIN_COMBINATIONS.any? do |combo|
    @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" ||
      @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
  end
    select_return =  WIN_COMBINATIONS.select do |combo|
      @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" ||
        @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
  end
  if any_return == false
    any_return
  elsif select_return != nil
    win_return = select_return[0]
  end
end

def full? #is every board space taken with X/O?
  @board.all? do |board_element| board_element == "X" || board_element == "O" end
end

def draw? #is current board full but not won?
    full? == true && won? == false
end

def over? #is game won, drawn, or full?
  full? == true || won? != false || draw? == true
end

def winner #returns winning line array
  if won? != false
    win_line = won?
    @board[win_line[0]]
  end
end
#Issues with lab 1)Wasn't made clear to switch user_char, that 1D array needed
#to be extracted from 2D array,
end

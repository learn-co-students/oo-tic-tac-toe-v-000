class TicTacToe
  def initialize(board = nil)
    @board = board ||
    Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


def input_to_index(user_input)
    index = user_input.to_i - 1
  end


def move(index, token = "X")
    @board[index] = token
  end


def position_taken?(index)
     @board[index] != "" && @board[index] != " "
  end


def valid_move?(index)
    if index.between?(0,8) && position_taken?(index) == false
      return true;
    else
      return false || nil
    end
  end

  #turn_count for the number of turns that have been played
  def turn_count
    counter = 0
    @board.each do |index|
      if index == "X" || index == "O"
      counter += 1
    end
  end
    return counter
  end

  #current_player to determine who's turn it is
  def current_player
    if turn_count.even? == true
      return "X"
    elsif turn_count.odd? == true
      return "O"
    end
  end

  def turn
    puts "Please make a move. Enter a position 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
      token = current_player
    if valid_move?(index)
      move(index, token)
      display_board

    else
      puts "That position is not valid."
      puts "Try again. Enter a position 1-9:"
        turn
  end
end


  def won?
  WIN_COMBINATIONS.detect do |win_index|
    win_index.all? {|index| @board[index] == "X" } ||
     win_index.all? {|index| @board[index] == "O" }

  end
end

#full? to see if board is full
def full?
  full_board = @board.none? do |index|
    index == " " || index == ""
  end
end


def draw?
  if won? == nil && full? == true
    return true
  else
    return false
  end
end

def over?
  if won? || full? || draw?
    true
  else
    false
  end
end

#winner to determine who won the game

  def winner
  	winning_player = won?

  if !winning_player
  		return nil
  	end
  	winning_player.each do |i|
  		if @board[i] == "X"
  			return "X"
  		elsif @board[i] == "O"
  			 return "O"
  		end
  	end
  end


  def play
    game = TicTacToe.new
    until over?
      turn
    end
    if won?
    	puts "Congratulations #{winner}!"
    elsif draw?
    	puts "Cat's Game!"
    else
      nil
     end
  end


end

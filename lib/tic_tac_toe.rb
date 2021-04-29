#require 'pry'

class TicTacToe
  def initialize(board = nil) #initializing a new empty board
    @board = board || Array.new(9, " ")
  end

  # Defining WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,3,6], # left column
    [1,4,7], # middle column
    [2,5,8], # right column
    [0,4,8], # diagonal 1
    [2,4,6] # diagonal 2
  ]

  #Defining the display board
  def display_board
    def dash
      puts "-----------"
    end
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    dash
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    dash
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  #Converting user input to index
  #def input_to_index(user_input)
  #  user_input.to_i - 1
  #end

  #Defining the move to fill the board with character
  def move(location, token="X")
    @board[location.to_i - 1] = token
  end

  #Defining if the position to be occupied if filled or empty
  def position_taken?(position)
    @board[position.to_i] != " " && @board[position.to_i] != ""
  end

  #Checks if the move requested is valid or not
  def valid_move?(location)
    #binding.pry
    (location.to_i - 1).between?(0,8) && !position_taken?(location.to_i - 1)
  end

  #Fills in the move requested by the player on the board
  def turn
    puts "Please enter 1-9:"
    location = gets.strip
    #index = input_to_index(input)
    token = current_player
    if valid_move?(location)
      move(location, token)
      display_board
    else
      turn
    end
  end

  #Counts the number of turns carried out by counting filled positions
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  #Determines the current character by judging the number of plays made
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  #define a method to check for winning combinations
  def won?
    win_combo = nil
    TicTacToe::WIN_COMBINATIONS.each do |win_combination|
      position_1 = @board[win_combination[0]] # load the value of the board at win_index_1
      position_2 = @board[win_combination[1]] # load the value of the board at win_index_2
      position_3 = @board[win_combination[2]] # load the value of the board at win_index_3
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        win_combo = win_combination # return the win_combination indexes that won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        win_combo = win_combination
      end
    end
    win_combo
  end

  #Checks if the board is full or not
  def full?
    @board.all? {|x| x != " "}
  end

  #Checks if the board is draw
  def draw?
    if won? == nil && full? == true
      return true
    end
  end

  #Checks if the game is over
  def over?
    if won? != nil || draw? == true || full? == true
      return true
    end
  end

  #Determines the winner character
  def winner
    token = nil
    if won? != nil
      win_combo = won?
      token = @board[win_combo[0]]
    end
    token
  end

  #Defines the play method
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end

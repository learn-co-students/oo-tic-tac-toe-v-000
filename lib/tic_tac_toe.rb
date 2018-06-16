require 'pry'

class TicTacToe

  attr_accessor :board
  #constant that provides a library of possible win combinations
  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,3,6], # left column
    [1,4,7], # middle column
    [2,5,8], # right column
    [0,4,8], # left-top to right-bottom diagonal
    [2,4,6], # right-top to left-bottom diagonal
  ]

  #set a @board variable equal to a new, empty array that represents the game board
  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  #start of helper methods
  #displays the board when called
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  #changes user input to proper index
  def input_to_index(input)
    input = input.to_i - 1
  end

  #takes in the input that the player would like to input onto the board
  def move(index, value)
    board[index] = value
  end

  #checks to see if the selected position is available for user in puts
  def position_taken?(index)
    board[index] != " "
  end

  #ensures that the players requested move is actually valid: present on the board and not already filled with a token
  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  #counts the number of turns taken
  def turn_count
    board.count {|turn| turn.include?("X") || turn.include?("O")}
  end

  #encapsulates the logic to complete multiple turns
def turn
  puts "Please enter 1-9"
  input = gets.strip
  index = input_to_index(input)
  if !valid_move?(index)
    turn
  else
    move(index, current_player)
  end
  display_board
end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|play| board[play] == "X"} || combo.all? {|play| board[play] == "O"}
        return combo
      end
    end
    false
  end

  def full?
    !board.include?(" ") ? true : false
  end

  #chcks if the board is full without a winner
  def draw?
    full? && !won?
  end

  #checks if the game was won or a draw
  def over?
    won? || draw?
  end

  #checks if the game has a winner
  def winner
    if won?
      winning_play = won?
      first_play = winning_play[0]
      if @board[first_play] == "X"
        "X"
      elsif @board[first_play] == "O"
        "O"
      end
    else
      nil
    end
  end
  #end of helper methods

  #starts the game
  def play
    while !over? do
      turn
    end
    player_x_o = winner
    if player_x_o
      puts "Congratulations #{player_x_o}!"
    else
      puts "Cat's Game!"
    end
  end
end

class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  ### WIN_COMBINATIONS constant ###
  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # Left column
    [1, 4, 7], # Middle column
    [2, 5, 8], # Right column
    [0, 4, 8], # Diagonal
    [2, 4, 6], # Diagonal
  ]
  #################################
  #end
  ### DISPLAY_BOARD method ###
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  ############################
  ### INPUT_TO_INDEX method ###
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  #############################
  ### MOVE method ###
  def move(position, character = "X")
    @board[position.to_i] = character
  end
  ###################
  ### POSITION_TAKEN? method ###
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    #else board[index] == "X" || board[index] = "O"
  else true
  end
  end
  ##############################
  ### VALID_MOV? method ##############
  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0, 8) == true
      true
    else
      false
  #  if valid_move?.between(0, 8)
    #  true
  end
  end
  ####################################
  ### TURN method ##############
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index) == false
    #puts "Please enter 1-9:"
    #use recursion instead
    turn #recursive
  else
      character = current_player
    move(index, character)
    #move(board, index, character = "X")
    display_board
  end
  end
  ##############################
  ### TURN_COUNT method ##############
  def turn_count
  9 - @board.count(" ")
  end
  ####################################
  ### CURRENT_PLAYER method ##############
  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end
  ########################################
  ### WON? method ##############
  def won?
  WIN_COMBINATIONS.detect do |win_combinations|
  @board[win_combinations[0]] == "X" && @board[win_combinations[1]] == "X" && @board[win_combinations[2]] == "X" || @board[win_combinations[0]] == "O" && @board[win_combinations[1]] == "O" && @board[win_combinations[2]] == "O"
      end
    end
  ##############################
  ### FULL? method ##############
  def full?
  #if board.none?{|player| player = " "}
  if @board.all?{|player| player == "X" || player == "O"}
  true
  else
    false
  end
  end
  ###########@###################
  ### DRAW? method ##############
  def draw?
    if !won? && full?
      true
    else
      false
  end
  end
  ###############################
  ### OVER? method ##############
  def over?
    if won? || draw? || full?
      true
    else
      false
  end
  end
  ###############################
  ### WINNER method ##############
  def winner
  if win_combinations = won?
    @board[win_combinations[0]]
  end
  end
  ################################
  ### PLAY method ##############
  def play
  until over?
    turn
  end
  if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
  end
  end
  ##############################
end

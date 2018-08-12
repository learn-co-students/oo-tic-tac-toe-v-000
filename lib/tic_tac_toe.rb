class TicTacToe
  #Initialize with an accepted or blank board
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  #displays board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle Row
    [6,7,8], #Bottom row
    [0,3,6], #first columns
    [1,4,7], #second columns
    [2,5,8], #last column
    [0,4,8], #first diagonal
    [2,4,6] #second diagonal
  ]

  #converts user's input to an index on the board
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  #Defines the current player
  def current_player
    x_plays = 0
    o_plays = 0

    @board.each do |spot_on_board|
      x_plays += 1 if spot_on_board == "X"
      o_plays += 1 if spot_on_board == "O"
    end

    next_player = x_plays % 2 == o_plays % 2 ? "X" : "O"
  end

  #plays a move
  def move(index, current_player = "X")
    @board[index] = current_player
  end

  #determines if position is taken
  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  #determines if desired move is valid
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  #user takes a turn
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    player = current_player
    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
    end
  end

  #number of turns taken
  def turn_count
    count = 0
    @board.each do |spot_on_board|
      count += 1 if spot_on_board == "X" || spot_on_board == "O"
    end
    count
  end

  #determines if win is true or false
def won?
    res = false
    WIN_COMBINATIONS.each do |win_combination|
      board_entries = [@board[win_combination[0]], @board[win_combination[1]], @board[win_combination[2]]]
      board_entries == ["X", "X", "X"] || board_entries == ["O", "O", "O"] ? res = win_combination : false
    end
    res
  end

  #If the board includes "" or " ", the board is not full.
  def full?
    @board.include?("") || @board.include?(" ") ? false : true
  end

  #if nobody won but the board is full, it's a draw
  def draw?
    won? == false && full? == true ? true : false
  end

  # the game is over when somebody wins or there is a draw
  def over?
    draw? == true || won? != false ? true : false
  end

  #defines the winner if the game has been won
  def winner
    win_combination = won?
    if win_combination == false
      nil
    elsif @board[win_combination[0]] == "X"
      return "X"
    elsif @board[win_combination[0]] == "O"
      return "O"
    end
  end

  #executes gameplay
  def play
    while over? == false
      turn
    end

    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end

end

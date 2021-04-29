class TicTacToe
  def initialize()
    @board = [ " ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [  # win combinations
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # left c
    [1,4,7], # middle c
    [2,5,8], # right c
    [0,4,8], # diag lr
    [2,4,6]  # diag rl
  ]

  def display_board    #displays board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)    #converts user input to index value
    input.to_i - 1
  end

  def move(index, current_player = "X")    # makes the move
    @board[index] = current_player
  end

  def position_taken?(location)        #tests for empty board space
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)       # tests move validity
    index.between?(0,8) && !position_taken?(index)
  end

  def turn     # turn input
    puts "Please enter your move (1-9):"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count   # returns turns played
    counter = 0
    @board.each do |space|
      if space == "X"
        counter += 1
      elsif space == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player  # uses turn_count to determine current player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?   # do we have a winner?
    WIN_COMBINATIONS.each do |win_checker|
      win_index_1 = win_checker[0]
      win_index_2 = win_checker[1]
      win_index_3 = win_checker[2]
      cross_check = [@board[win_index_1], @board[win_index_2], @board[win_index_3]]

      if cross_check.all? do |check| # check x win
        check == "X"
      end
      return win_checker

      elsif cross_check.all? do |check| # check O win
        check == "O"
      end
      return win_checker

      elsif @board.none? do |check| # check empty board
        (check == "X" || check == "O")
      end
      return false

      end
  end
    return false
  end

  def full?  # checks if board is full
    @board.all? do |check|
      (check == "X" || check == "O")
    end
  end

  def draw?    # checks for a draw
    if won? == false && full? == true
      return true
    else
      return false
    end
  end

  def over?    # is the game over?
    if won?.class == Array || full? == true || draw? == true
      return true
    else
      return false
    end
  end

  def winner   # returns the winner
    if over? == true && draw? == false
      winning = won?
      victor = @board[winning[0]]
      puts "#{victor} is the winner!"
      return victor
    end
  end

  def play   # play the game
    until over? || draw? || won?
      puts "#{turn_count} turns have been played."
      turn
    end

    if won?.class == Array # report winner
      puts "Congratulations #{@board[won?[0]]}!"
    elsif draw? == true    # report draw
      puts "Cat's Game!"
    end
  end

end

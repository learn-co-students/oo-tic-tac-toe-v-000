class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,3,6], # first column
    [1,4,7], # second column
    [2,5,8], # third column
    [0,4,8], # left diagonal
    [2,4,6] # right diagonal
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    separator_row = "-----------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts separator_row
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts separator_row
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i-1
  end

  def move(index,character="X")
    @board[index] = character
  end

  def position_taken?(index)
    if (@board[index] == " " || @board[index] == "" || @board[index] == nil)
      false
    elsif (@board[index] == "X" || @board[index] == "O")
      true
    end
  end

  def valid_move?(index)
    if (index.between?(0,8) && !position_taken?(index))
      true
    else
      false
    end
  end

  def turn_count
    counter = 0

    @board.each do |space|
      if (space == "X" || space == "O")
        counter += 1
      end
    end
    counter
  end

  def current_player
    turns = turn_count
    turns.even? ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|

      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
        win_combination
      else
        false
      end
    end
  end

  def full?
    positions=[0,1,2,3,4,5,6,7,8]
    checkPositions = positions.select do |index|
      position_taken?(index)
    end
    if checkPositions.length == 9
      true
    else
      false
    end
  end

  def draw?
    # true if board not won and full
    # false if board not won and not full
    # false if board is won
    if (!won? && full?)
      true
    elsif (!(won? && full?) || (won?))
      false
    else
    end
  end

  def over?
    # true if board won
    # true if board draw
    # true if board full
    if (won? || draw? || full?)
      true
    else
      false
    end
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play

    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat\'s Game!"
    else
    end

  end

end

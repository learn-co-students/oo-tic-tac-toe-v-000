class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [0,4,8], #downward diagonal
    [2,4,6], #upward diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, player_token="X")
    @board[index] = player_token
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    @board.each do |board_index|
      if board_index == "X" || board_index == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
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

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        [position_1,position_2,position_3]
      else
        false
      end
    end
  end

  def full?
    @board.all? do |full_board|
      full_board == "X" || full_board == "O"
    end
  end

  def draw?
    if won?
      false
    elsif full? == true
      true
    end
  end

  def over?
    if won? || draw?
      true
    end
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
      if draw? == true
        puts "Cat's Game!"
      else
        puts "Congratulations #{winner}!"
      end
  end

end

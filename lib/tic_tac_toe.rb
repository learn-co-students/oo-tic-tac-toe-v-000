class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def turn_count
    9 - @board.count(" ")
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Pick a spot between 1-9"
    player_input = gets.strip
    index = input_to_index(player_input)
    if valid_move?(index)
      token = current_player
      move(index, token)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do|combo|
      if (@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O")
        return combo
      end
    end
  end

  def full?
    @board.all?{|moves| moves == "X" || moves == "O"}
  end

  def draw?
    full? & !won?
  end

  def over?
    won? || draw?
  end

  def winner
    return nil if !won?
    winning_token = won?[0]
    if @board[winning_token] == "X"
      "X"
    elsif @board[winning_token] == "O"
      "O"
    end
  end

  def play
    display_board
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end

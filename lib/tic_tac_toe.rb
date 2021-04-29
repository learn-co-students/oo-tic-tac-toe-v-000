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
      @index = input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X"|| @board[index] == "O"
  end

  def valid_move?(index)
      if index < 0 || index > 8
          return false
      elsif position_taken?(index)
          return false
      else
          return true
      end
  end

  def turn_count
      @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
      turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
        move(index, token)
        display_board
    else turn
    end
  end

  def won?
      WIN_COMBINATIONS.detect do |win_combo|
          @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[2]] == @board[win_combo[1]] && position_taken?(win_combo[0])
      end
  end

  def full?
      @board.all? do |place|
          place == "X" || place == "O"
      end
  end

  def draw?
      if full? && !won?
          true
      else won?
          false
      end
  end

  def over?
      won? || draw? || full?
  end

  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end

  def play
    until over?
      turn
    end
    if winner == "X" || winner == "O"
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end

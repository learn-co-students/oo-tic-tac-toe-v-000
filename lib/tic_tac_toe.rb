require 'pry'
class TicTacToe

  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
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

  def input_to_index(user_input)
    index = user_input.to_i - 1
  end

  def move(input_to_index, token = "X")
    @board[input_to_index] = token
  end

  def position_taken?(input_to_index)
    if @board[input_to_index] == "X" || @board[input_to_index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(index)
    @board[index] == " " && index.between?(0,8)
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      token = current_player
      move(index, token)
      display_board
    else
      turn
    end
  end

  def won?

    WIN_COMBINATIONS.detect do |win_combo|

      @board[win_combo[0]] && @board[win_combo[1]] &&
      @board[win_combo[1]] && @board[win_combo[2]] &&
      position_taken?(win_combo[0])

      if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" &&
        @board[win_combo[2]] == "X"
        return win_combo
      elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" &&
        @board[win_combo[2]] == "O"
        return win_combo
      else
        false
      end
    end
  end

  def full?
    if @board.detect {|position| position == " " || position == nil}
      false
    else
      true
    end
  end

  def draw?
    if !won? && full?
      true
    end
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if win_combo = won?
      return @board[win_combo.first]
    end
  end

  def play
    until over?
      current_player
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end

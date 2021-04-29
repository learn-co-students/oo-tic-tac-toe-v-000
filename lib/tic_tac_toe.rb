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
    user_input.to_i - 1
  end

  def move(board, current_player= "X")
    @board[board] = current_player
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
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
    if valid_move?(index)
      move(index, current_player)
      display_board
        else
      turn
    end
  end

  def won?
    if @board[0] == "X" && @board[1] == "X" && @board[2] == "X"
      return WIN_COMBINATIONS[0]
    elsif @board[0] == "O" && @board[1] == "O" && @board[2] == "O"
        return WIN_COMBINATIONS[0]
    elsif @board[3] == "X" && @board[4] == "X" && @board[5] == "X"
      return WIN_COMBINATIONS[1]
    elsif @board[3] == "O" && @board[4] == "O" && @board[5] == "O"
      return WIN_COMBINATIONS[1]
    elsif @board[6] == "X" && @board[7] == "X" && @board[8] == "X"
      return WIN_COMBINATIONS[2]
    elsif @board[6] == "O" && @board[7] == "O" && @board[8] == "O"
      return WIN_COMBINATIONS[2]
    elsif @board[0] == "X" && @board[3] == "X" && @board[6] == "X"
      return WIN_COMBINATIONS[3]
    elsif @board[0] == "O" && @board[3] == "O" && @board[6] == "O"
      return WIN_COMBINATIONS[3]
    elsif @board[1] == "X" && @board[4] == "X" && @board[7] == "X"
      return WIN_COMBINATIONS[4]
    elsif @board[1] == "O" && @board[4] == "O" && @board[7] == "O"
      return WIN_COMBINATIONS[4]
    elsif @board[2] == "X" && @board[5] == "X" && @board[8] == "X"
      return WIN_COMBINATIONS[5]
    elsif @board[2] == "O" && @board[5] == "O" && @board[8] == "O"
      return WIN_COMBINATIONS[5]
    elsif @board[0] == "X" && @board[4] == "X" && @board[8] == "X"
      return WIN_COMBINATIONS[6]
    elsif @board[0] == "O" && @board[4] == "O" && @board[8] == "O"
      return WIN_COMBINATIONS[6]
    elsif @board[2] == "X" && @board[4] == "X" && @board[6] == "X"
      return WIN_COMBINATIONS[7]
    elsif @board[2] == "O" && @board[4] == "O" && @board[6] == "O"
      return WIN_COMBINATIONS[7]
    else
      return false
    end
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if @board[0] == "X" && @board[1] == "X" && @board[2] == "X"
      return "X"
    elsif @board[0] == "O" && @board[1] == "O" && @board[2] == "O"
        return "O"
    elsif @board[3] == "X" && @board[4] == "X" && @board[5] == "X"
      return "X"
    elsif @board[3] == "O" && @board[4] == "O" && @board[5] == "O"
      return "O"
    elsif @board[6] == "X" && @board[7] == "X" && @board[8] == "X"
      return "X"
    elsif @board[6] == "O" && @board[7] == "O" && @board[8] == "O"
      return "O"
    elsif @board[0] == "X" && @board[3] == "X" && @board[6] == "X"
      return "X"
    elsif @board[0] == "O" && @board[3] == "O" && @board[6] == "O"
      return "O"
    elsif @board[1] == "X" && @board[4] == "X" && @board[7] == "X"
      return "X"
    elsif @board[1] == "O" && @board[4] == "O" && @board[7] == "O"
      return "O"
    elsif @board[2] == "X" && @board[5] == "X" && @board[8] == "X"
      return "X"
    elsif @board[2] == "O" && @board[5] == "O" && @board[8] == "O"
      return "O"
    elsif @board[0] == "X" && @board[4] == "X" && @board[8] == "X"
      return "X"
    elsif @board[0] == "O" && @board[4] == "O" && @board[8] == "O"
      return "O"
    elsif @board[2] == "X" && @board[4] == "X" && @board[6] == "X"
      return "X"
    elsif @board[2] == "O" && @board[4] == "O" && @board[6] == "O"
      return "O"
    else
      return nil
    end
  end

def play
  until over?
      turn
      end
    if draw?
      puts "Cat's Game!"
    end
    if over?
      puts "Congratulations #{winner}!"
    end
  end


end

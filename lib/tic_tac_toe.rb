class TicTacToe

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

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts" #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts"-----------"
    puts" #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts"-----------"
    puts" #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input = input.to_i
    index = input - 1
    return index
  end

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(index)
    taken = @board[index] == "X" || @board[index] == "O"
    if !taken
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    taken = position_taken?(index)
    present = index > -1 && index < 9
    if !taken && present
      return true
    else
      return false
    end
  end

  def turn
    valid = false
    while !valid
      puts "Please enter 1-9"
      input = gets.strip
      index = input_to_index(input)
      valid = valid_move?(index)
    end
      move(index, current_player)
      display_board
  end

  def won?
    x_win = nil
    o_win = nil
    winning_combo = nil
    o_win = WIN_COMBINATIONS.detect {|combo| combo.all? {|space| @board[space]=="O"}}
    if o_win != nil
      winning_combo = o_win
    else
      x_win = WIN_COMBINATIONS.detect {|combo| combo.all? {|space| @board[space]=="X"}}
      if x_win
        winning_combo = x_win
      end
    end
    if winning_combo != nil
      return winning_combo
    else
      return false
    end
  end




  def full?
    not_full = true
    not_full = @board.any? {|space| space == " "}
    if not_full
      return false
    else
      return true
    end
  end

  def draw?
    if over? && !won?
      return true
    end

  end

  def over?
    if full?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      return @board[won?[0]]
    else
      return nil
    end
  end

  def play
    victor = winner
    until over?
      turn
    end
    if draw?
      puts draw?
    else
      puts "Congratulations #{victor}!"
    end
  end

end

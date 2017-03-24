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
    [6,4,2]
  ]

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)  #Get user move, -1 for proper array location
    @user_input = user_input.to_i - 1
  end

  def move(input, token = "X")
  @board[input] = token

  end

  def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if position_taken?(index)
      return false
    elsif index >=0 && index <= 8
      return true
    end
  end

  def turn
    puts "Please enter 1-9:"
    @input = gets.chomp
    @index = input_to_index(@input)
    if (valid_move?(@index))
        move(@index, token = current_player)
        display_board
      else
        turn
  end
end

def won?
  top_row_win = WIN_COMBINATIONS[0]
  mid_row_win = WIN_COMBINATIONS[1]
  bot_row_win = WIN_COMBINATIONS[2]
  left_row_win = WIN_COMBINATIONS[3]
  mid_col_win = WIN_COMBINATIONS[4]
  rgt_col_win = WIN_COMBINATIONS[5]
  lef_di_win = WIN_COMBINATIONS[6]
  rgt_di_win = WIN_COMBINATIONS[7]

  if @board[top_row_win[0]] == "X" &&  @board[top_row_win[1]] == "X" && @board[top_row_win[2]] == "X" ||
    @board[top_row_win[0]] == "O" && @board[top_row_win[1]] == "O" && @board[top_row_win[2]] == "O"
  return top_row_win

elsif @board[mid_row_win[0]] == "X" && @board[mid_row_win[1]] == "X" && @board[mid_row_win[2]] == "X" ||
  @board[mid_row_win[0]] == "O" && @board[mid_row_win[1]] == "O" && @board[mid_row_win[2]] == "O"
  return mid_row_win

elsif @board[bot_row_win[0]] == "X" && @board[bot_row_win[1]] == "X" && @board[bot_row_win[2]] == "X" ||
  @board[bot_row_win[0]] == "O" && @board[bot_row_win[1]] == "O" && @board[bot_row_win[2]] == "O"
  return bot_row_win

elsif @board[left_row_win[0]] == "X" && @board[left_row_win[1]] == "X" && @board[left_row_win[2]] == "X" ||
  @board[left_row_win[0]] == "O" && @board[left_row_win[1]] == "O" && @board[left_row_win[2]] == "O"
  return left_row_win

elsif @board[mid_col_win[0]] == "X" && @board[mid_col_win[1]] == "X" && @board[mid_col_win[2]] == "X" ||
  @board[mid_col_win[0]] == "O" && @board[mid_col_win[1]] == "O" && @board[mid_col_win[2]] == "O"
  return mid_col_win

elsif @board[rgt_col_win[0]] == "X" && @board[rgt_col_win[1]] == "X" && @board[rgt_col_win[2]] == "X" ||
  @board[rgt_col_win[0]] == "O" && @board[rgt_col_win[1]] == "O" && @board[rgt_col_win[2]] == "O"
  return rgt_col_win

elsif @board[lef_di_win[0]] == "X" && @board[lef_di_win[1]] == "X" && @board[lef_di_win[2]] == "X" ||
  @board[lef_di_win[0]] == "O" && @board[lef_di_win[1]] == "O" && @board[lef_di_win[2]] == "O"
  return lef_di_win

elsif @board[rgt_di_win[0]] == "X" && @board[rgt_di_win[1]] == "X" && @board[rgt_di_win[2]] == "X" ||
  @board[rgt_di_win[0]] == "O" && @board[rgt_di_win[1]] == "O" && @board[rgt_di_win[2]] == "O"
  return rgt_di_win

  else
  false
end
  end #if

  def full?
    if @board.any? {|space| space == " "}
  false
else
  true
    end #if
  end #method

  def draw?
    if full? && !won?
      true
    elsif
      won?
      false
    end  #if
  end  #method

  def over?
    if full? || won? || draw?
      true
    end  #if
  end  #method

  def winner
  winny = []
    if won?
  winny << won?
    return @board[winny[0][0]]
    end
  end

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
end

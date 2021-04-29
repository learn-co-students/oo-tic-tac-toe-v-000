

class TicTacToe

  def initialize
    @board  = Array.new(9," ")
  end

  def board
    @board
  end

  def board= (new_board)
    @board = new_board
  end

   # Creates an array with 9 elements filled with " "
   WIN_COMBINATIONS = [
   [0,1,2], # Top row
   [3,4,5],  # Middle row
   [6,7,8], #bottom row
   [0,3,6], #first columns
   [1,4,7], #2nd columns
   [2,5,8], #3rd columns
   [0,4,8], #first diagonals
   [2,4,6] #diagonal 2nd
   ]
   def input_to_index(input)
     index = input.to_i
     index -= 1
   end

  def current_player(board)
    turn_count(board) % 2 == 0 ? "X" : "O"
  end

  def move(index,token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    !(board[index].nil? || board[index] == " ")
  end

  def valid_move?(index)
    if index <= 8 && index >= 0
      if (position_taken?(index) == false)
        return true
      end
    else
      return false
    end
  end

  def turn_count
    board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turns = turn_count()
    if turns % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index,current_player())
      display_board()
    else
      turn()
    end
  end

  def won?()
  WIN_COMBINATIONS.find do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    (board[win_index_1] == "X" && board[win_index_1] == board[win_index_2] && board[win_index_1] == board[win_index_3]) || (board[win_index_1] == "O" && board[win_index_1] == board[win_index_2] && board[win_index_1] == board[win_index_3])
  end

end

def full?()
  full = board.all? {|num| num == "X" || num == "O"}
  return full
end

def draw?()
  if !(won?()) && full?()
    return true
  else
    return false
  end
end
def over?()
  if won?() || draw?() || full?()
    return true
  else
    return false
  end
end

def winner()
  win_indices = won?()
  if !win_indices
    return nil
  end
  index = win_indices[0]
  if board[index] == "X"
    return "X"
  elsif board[index] == "O"
    return "O"
  end
end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def play()
    counter = 0
    while counter < 9
      if over?()
        break
      end
      # binding.pry
      turn()
      counter += 1
    end

    if won?()
      champ = winner()
      puts "Congratulations #{champ}!"
    elsif draw?()
      puts "Cat's Game!"
    end
  end

end

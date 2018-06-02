class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end #initialize
  
  WIN_COMBINATIONS = [
    [0,1,2], #top
    [3,4,5], #middle
    [6,7,8], #bottom
    [0,3,6], #left col
    [1,4,7], #middle col
    [2,5,8], #right col
    [0,4,8], #left diag
    [2,4,6] #right diag
    ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end #display_board
  
  def input_to_index(user_input)
    x = user_input.to_i
    move = x - 1
  end
  
  def move(position, player_token)
    @board[position] = player_token
  end
  
  def position_taken?(index)
    !( @board[index] == "" || @board[index] == " " || @board[index] == nil)
  end
  
  def valid_move?(index)
    if index.between?(0,8)
         if @board[index] == "" || @board[index] == " " || @board[index] == nil
         true
        else
          false
      end
    else
    return nil  
    end
  end
  
  def turn_count
    count1 = @board.count ("O")
    count2 = @board.count ("X")
    count3 = count1 + count2
    return count3
  end
  
 def current_player
   even_odd = turn_count
   if turn_count == 0 || true == even_odd.even?
      "X"
    else
      "O"
    end
  end
  
  
end # class
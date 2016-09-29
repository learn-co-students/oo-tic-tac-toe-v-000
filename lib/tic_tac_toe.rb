class TicTacToe
  WIN_COMBINATIONS = [ [0,1,2] , [3,4,5], [6,7,8] , [0,3,6] ,[1,4,7] , [2,5,8] , [ 0,4,8], [6,4,2]]


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
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(n)
     return n.to_i - 1
  end

  def move(n , ch)
    index=input_to_index(n)
    @board[index] = ch
  end


  def valid_move?(n)
    index= input_to_index(n)
    if index.between?(0, 8) == true  && position_taken?(index) == false
        return true
    else
        return false
    end
  end


  # re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
  def position_taken?(index)
    if index == nil || index == "" || index == " " || @board[index] == nil || @board[index] == " " || @board[index] == ""
      return false
    else
      return true
    end
  end

  def turn
    puts "Please enter 1-9:"
    n = gets.strip

    if valid_move?(n) == false
       puts "Please enter valid move"
       turn
     end
  move(n, current_player)
  display_board
  end


  def turn_count
    count=0
  @board.each do | element |
    if element == 'X' || element == 'O'
       count += 1
     end
   end
     return count
   end

  def current_player
    n=turn_count
    if n.even?
       return 'X'
    else
         return 'O'
     end
  end

  def won?

    WIN_COMBINATIONS.each do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    if (position_1 == 'X' && position_2 == 'X' && position_3 == 'X' ) || (position_1 == 'O' && position_2 == 'O' && position_3 == 'O' )
       return win_combination
    end
  end
  return false
  end



  def full?
  return   !@board.any?  { |element| element == " " || element == ""}
  end

  #if the board has not been won and is full and false if the board is not won and the board is not full, and false if the board is won
  def draw?
    if won?
       return false
    elsif full?
         return true
    else
        return false

    end
  end

  #returns true if the board has been won, is a draw, or is full
  def over?
    if won? || draw? || full?
      return true
    else
       return false
    end
  end

  def winner
    wincom = won?
    if wincom == false
        return nil
    else
        return @board[wincom[0]]
  end
  end



  def play
    until over?
    puts "Input on a turn of the game player " + current_player
         turn
     end
   if won?
      if winner == 'X'
          puts "Congratulations X!"
      elsif  winner == 'O'
           puts "Congratulations O!"
      end
  elsif  draw?
    puts "Cats Game!"
  end
  end
end

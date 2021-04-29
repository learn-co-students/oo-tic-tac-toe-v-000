class TicTacToe
  
  def initialize (board = nil)
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,3,6], #Left column
    [1,4,7], #Middle column
    [2,5,8], #Right column
    [0,4,8], #Diagonal Top Left to Bottom Right
    [2,4,6] #Diagona Top Right to Bottom Left
    
    ]

  def display_board
  
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1 #return this
  end
  
  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    if @board[index] != " "
      true
    else
      false
    end
  end
  
  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0, 8)
      true
    else
      false
    end
  end
  
  def turn
    puts "Please enter 1-9"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index) == false
      turn
    else
      move(index, current_player)
      display_board
    end
  end

  def turn_count
    @board.count { |value| value == "X" || value =="O" }
  end
  
  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    empty = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    winning_numbers = [] #store and return this
  
    WIN_COMBINATIONS.each do |array|
      if empty == @board
        return false
      elsif array.all? { |value| @board[value] =="X" } || array.all? { |value| @board[value] =="O" }
        winning_numbers = array
        break
      else
        winning_numbers = nil
      end # end for If statements
    end # end for enumerations
    winning_numbers #return this value
  end #end for function won?

  def full?
   !@board.detect { |x| x == " " }
  end

  def draw?
    if won?
      return false
    else
      if !full?
        return false
      else
        return true
      end
    end
  end

  def over?
    won? || draw?
  end
  
  def winner
    winner_return = won?
    if winner_return == nil
      return nil
    else
      return @board[winner_return.first]
    end
  end

  def play
    while !over?
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
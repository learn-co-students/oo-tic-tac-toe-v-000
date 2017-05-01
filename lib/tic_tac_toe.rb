class TicTacToe
  
  def initialize(board = nil)
    @board = Array.new(9," ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,5,8],[2,4,6],[3,4,5],[6,7,8]
  ]

  def display_board
   puts " #{@board[0]}"+" | "+"#{@board[1]}"+" | "+"#{@board[2]} "
   puts "-----------"
   puts " #{@board[3]}"+" | "+"#{@board[4]}"+" | "+"#{@board[5]} "
   puts "-----------"
   puts " #{@board[6]}"+" | "+"#{@board[7]}"+" | "+"#{@board[8]} "

  end

  def input_to_index(user_input)
    index = user_input.to_i - 1
  end

  def move(index, character = "X")
    @board[index] = character
  end

  def position_taken?(position)
      if @board[position] == "X" || @board[position] == "O"
         true
      else
       false
      end 
    end


  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
   return true
    else 
     return false
  end
 end

 def turn_count
   #Turn counter
   count = 0
   @board.each do |space|
    if (space == "X" || space == "O")
      count +=1
    end
  end
  return count
  end

  def current_player
    count = turn_count
    if count == 0
      current_player = "X"
    elsif(count % 2 == 0)
      current_player = "X"
    else
      current_player = "O"
    end
  return current_player
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full?
    @board.all? {|token| token == "X" || token == "O"}
  end

  def draw?
   !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    if !over? || draw?
      return nil
    end
     if won? != false
         return @board[won?[0]]
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

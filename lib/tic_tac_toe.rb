class TicTacToe
  def initialize(board = Array.new(9," "))
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

 def input_to_index(input)
   input.to_i - 1
 end

 def move(index, char)
   @board[index] = char
 end

 def position_taken?(index)
   (@board[index] ==  " " || @board[index] == "  " || @board[index] == nil) ?
     false : true
 end

 def valid_move?(index)
   position_taken?(index) == false && index.between?(0,8)
 end

 def turn_count
   @turn = 0
   @board.each do |plays|
       if plays == "X" || plays == "O"
         @turn += 1
       end
    end
    @turn
 end

 def turn
   puts "Please enter 1-9:"
   input = gets.strip
   index = input_to_index(input)
   if valid_move?(index)
     char = current_player
     move(index,char)
   else
     turn
   end
   display_board
 end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return combo
      end
    end
  end

  def full?
      @board.all?{|combo| combo == "X" || combo == "O"}
  end

  def draw?
    full? && !won? ? true : false
  end

  def over?
    draw? || won? ? true : false
  end

  def winner
    if combo = won?
      @board[combo[0]]
    end
  end


  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end

  end


end #end Class

#game = TicTacToe.new
#game.play

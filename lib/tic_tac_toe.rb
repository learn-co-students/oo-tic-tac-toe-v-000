class TicTacToe

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize (board = nil)
    @board = board || Array.new(9, " ")
  end

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

 def move(idx, token)
   @board[idx] = token
 end

 def position_taken?(idx)
   @board[idx] != " "
 end


 def valid_move?(idx)
   idx.between?(0, 8) && !position_taken?(idx)
 end

 def turn_count
   @board.count { |cell| cell != " " }
 end

 def current_player
   turn_count % 2 == 0 ? "X" : "O"
 end

 def turn
   puts "Please enter 1-9:"
    input = gets.strip
       idx = input_to_index(input)
    if valid_move?(idx)
       move(idx, current_player)
    else
      turn
    end
  display_board
 end

 def won?
   WIN_COMBINATIONS.find do |cmbo|
     @board[cmbo[0]] == @board[cmbo[1]] &&
     @board[cmbo[1]] == @board[cmbo[2]] &&
     position_taken?(cmbo[0])
   end
   end

   def full?
    @board.all? { |cell| cell != " " }
   end

   def draw?
   !won? && full?
   end

   def over?
    draw? || won?
     end

     def winner
      if cmbo = won?
       @board[cmbo.first]
      end
    end

    def play
     until over?
       turn
     end
      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cat's Game!"
      end
    end


end

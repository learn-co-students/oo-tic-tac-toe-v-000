class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5],
    [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} " "|" " #{@board[1]} " "|" " #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} " "|" " #{@board[4]} " "|" " #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} " "|" " #{@board[7]} " "|" " #{@board[8]} "
  end

  def input_to_index(i)
     @input = i.to_i - 1
  end

  def move(input, token = "X")
    @board[input] = token
  end

  def position_taken?(input)
    return @board[input] == "X" || @board[input] == "O"
  end

  def valid_move?(pos)
    if(position_taken?(pos) || (pos < 0 || pos >= @board.length))
       false
     else
       true
     end
   end

   def turn
     token = current_player()
     puts "Please enter 1-9:"
     input = gets.strip
     index = input_to_index(input)
     if(valid_move?(index))
       move(index, token)
       display_board()
     else
       turn()
     end
   end

   def turn_count
     turns = 0
     @board.each do |pos|
       if pos == "X" || pos == "O"
         turns += 1
       end
     end
     turns
   end

   def current_player
     turns = turn_count()
     turns % 2 == 0 ? "X" : "O"
   end

   def won?
     WIN_COMBINATIONS.each do |win_combination|
       tokens = []
       win_combination.each do |pos|
         tokens << @board[pos]
       end
       if (tokens.all?{|t| t == "X"} || tokens.all?{|t| t == "O"})
         return win_combination
       end
     end
     false
   end

   def full?
     !(@board.include?(" "))
   end

   def draw?
     if(!(won?()) && full?())
       true
     else
       false
     end
   end

   def over?
     if(draw?() || won?())
       true
     else
       false
     end
   end

   def winner
     winner = won?()
     winner == false ? nil : @board[winner[0]]
   end

   def play
     until(over?())
       turn()
     end

     if(won?())
       puts "Congratulations #{winner()}!"
     elsif(draw?())
       puts "Cat's Game!"
     end
   end

end
class TicTacToe
  def initialize (board = nil)
    @board = board || Array.new(9," ")
  end

  WIN_COMBINATIONS = [[0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]

  def display_board

   puts" #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts"-----------"
   puts" #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts"-----------"
   puts" #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end



   def move(user_input,value = "X")
     user_input = user_input.to_i
     @index = user_input -1
     if @index <= 9
     @board[@index] = value
   end
   end



   def position_taken?(index)
     @board[index] == "X" || @board[index]=="O"
   end


   def valid_move?(index)
     index =index.to_i
     index.between?(0,8) &&  position_taken?(index) != true
   end


   def turn
     puts "Please enter 1-9:"
     user_input = gets.strip
     index = user_input.to_i -1
     if valid_move?
       value = current_player
       @board = move(value)
       display_board
     else
       turn
     end
   end

   def turn_count
     counter = 0
     @board.each do |space|
       if space == "X" || space == "O"
         counter += 1
       end
   end
   turn_count = counter
   end


   def current_player
   turn_count = turn_count
   if turn_count % 2 != 0
       return "O"
   else
       return "X"
   end
   end

   def won?
     WIN_COMBINATIONS.each do |combinations|
       if (@board[combinations[0]]== "X" && @board[combinations[1]]=="X" && @board[combinations[2]]=="X") ||
         (@board[combinations[0]] == "O" && @board[combinations[1]]== "O" && @board[combinations[2]]== "O")
       return combinations
     end
   end
   return false
   end


   def full?
     @board.all? do |value|
       value == "X" || value == "O"
     end
   end

   def draw?
     !won? && full?
   end

   def over?
     (@board.all? {|value| value == "X" || value == "O" }) ||
       won?
   end


   def winner
     combinations = won?
     if combinations
       @board[combinations[0]]
     else
       nil
   end
   end

   def play

     while (over? == false || nil) && (draw? == false||nil) do
       turn
     end

     if won? != false
       puts "Congratulations #{winner(@board)}!"
     else
       puts "Cats Game!"
     end
   end
 end

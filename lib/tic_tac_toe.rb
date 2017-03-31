class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],#top
    [3,4,5],#middle
    [6,7,8],#last
    [0,3,6],#1 vertical
    [1,4,7],#2 vertical
    [2,5,8],#3 verticl
    [0,4,8],#1 across
    [2,4,6]#2 across
  ]
  def initialize(board = Array.new(9, " "))
    @board = board
  end
  #
  # def win_combination=(win_combination)
  #   @win_combination = win_combination
  # end
  #
  # def win_combination
  #   @win_combination
  #   win_combination = [
  #   [0,1,2],#top
  #   [3,4,5],#middle
  #   [6,7,8],#last
  #   [0,3,6],#1 vertical
  #   [1,4,7],#2 vertical
  #   [2,5,8],#3 verticl
  #   [0,4,8],#1 across
  #   [2,4,6]#2 across
  #
  #   ]
  # end

  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

def input_to_index(user_input)
   user_input.to_i - 1
 end

 def move(index, token)
   @board[index] = token
 end

 def position_taken?(index)
   @board[index] == "X" || @board[index] == "O"
 end

 def valid_move?(index)
     !position_taken?(index) && index.between?(0, 8)
 end

 def turn
   puts "Please enter 1-9:"
   user_input = gets.chomp
   index = input_to_index(user_input)


   if valid_move?(index)
     move(index, current_player)
   else
     turn
     end
       display_board
   end

   def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
   turn_count % 2 == 0 ? "X" : "O"
 end

     def full?
       @board.all? {|i| i == "X" || i == "O"}
     end

     def won?
       WIN_COMBINATIONS.detect do |win_combination|
         win_index_1 = win_combination[0]
         win_index_2 = win_combination[1]
         win_index_3 = win_combination[2]

         position_1 = @board[win_index_1]
         position_2 = @board[win_index_2]
         position_3 = @board[win_index_3]

         if position_1 == position_2 && position_2 == position_3 && position_1 != " "
           win_combination
         end
       end
     end

     def draw?
       !won? && full?
     end

     def over?
       draw? || won? # a game is over when theres either a draw OR someone has won
     end

     def winner
       if win_combo = won?
         @board[win_combo[1]]
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
end

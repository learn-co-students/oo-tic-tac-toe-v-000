#Object oriented tic tac toe
class TicTacToe
  def initialize(board = nil)
      @board = board || Array.new(9, " ")
  end
 WIN_COMBINATIONS =
      [
      [0,1,2], #top row
      [3,4,5], #mid row
      [6,7,8], #bottom row
      [0,4,8], #right diag
      [2,4,6], #left diag
      [0,3,6], #left column
      [1,4,7], #mid column
      [2,5,8] #right col
      ]
      def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end

      def move(location, current_player = "X")
        location = location.to_i - 1
        @board[location] = current_player
      end

      def position_taken?(location)
        @board[location] != " " && @board[location] != ""
      end

      def valid_move?(location)
         #define position variable and minus it since array starts at 0
         location = location.to_i - 1
         location.between?(0,8) && !position_taken?(location)  #position is between range and position taken is
      end

    def turn
          display_board
          puts "Please enter 1-9:"
          input = gets.strip
          location = input.to_i
       if valid_move?(location)
          move(location, current_player)
       else
          turn
       end
    end

    def turn_count
      counter = 0  #sets counter to 0
        @board.each do |token|  #iterate board using instance variable
         if token == "X" || token == "O"
           counter+=1
         end
       end
       counter
     end

     def current_player
      turn_count % 2 == 0 ? "X" : "O"  #from http://www.tutorialspoint.com/ruby/ruby_operators.htm
     end

     def won?
       WIN_COMBINATIONS.find do |win|  # iterate over the winning combos and check tokens
         win.all? { |token| @board[token] == "X"} || win.all? { |token| @board[token] == "O"}
         end
       end

     def full?
       !@board.any? {|index| index == " "}
     end

     def draw?
       if !won? && full?
         return true
      else
        false
       end
     end

     def over?
       if won? || draw? || full?
         return true
       else
         return false
       end
     end

     def winner  #find the winner
       if won?
          won?.each do |value|   #value is X or O
           return @board[value]
         end
       end
     end

     def play
     while !over?
       turn
     end
     if won?
       puts "Congratulations #{winner}!"
     elsif draw?
       puts "Cats Game!"
     end
   end
end

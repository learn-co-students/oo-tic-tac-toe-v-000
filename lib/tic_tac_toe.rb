class TicTacToe
  attr_accessor :user_input

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,4,8], [6,4,2], [0,3,6], [1,4,7], [2,5,8] ]

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

  def move(index, char="X")
      @board[index] = char
      turn_count
      display_board
    end

  def position_taken?(board = nil, index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(board = nil, index)
    index.between?(0,8) && !position_taken?(board = nil, index)
  end

  def turn_count
    count = 0
    @board.each do |move|
      if move == "X" || move == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
     puts "Please enter 1-9:"
     i = gets.strip
     index = input_to_index(i)
     m = valid_move?(index)
     if m == true
       move(index, current_player)
     else m == false
       until m == true
         puts "Sorry, that was an invalid move. Please enter 1-9:"
         display_board
         i = gets.strip
         index = input_to_index(i)
         m = valid_move?(index)
         move(index, current_player)
       end
     end
   end

    def won?
       @board.all? {|i| i != " " || i != ""}
       winning_array = WIN_COMBINATIONS.detect do |win_array|
         if win_array.all? {|index| @board[index] == "X" } == true
           winning_array.inspect
           true
         elsif win_array.all? {|index| @board[index] == "O" } == true
           winning_array.inspect
           true
         end
       end
     end

    def full?
      @board.none? do |i|
        i == " " || i.nil?
      end
    end

     def draw?
       won? == nil && full? == true
     end

      def over?
        draw? == true || won? != nil
      end

      def winner
        if won? != nil
          winner = @board[won?[0]]
        end
      end

      def play
        until over? == true
          turn
        end
        if draw? == true
          puts "Cat's Game!"
        else won? == true
          puts "Congratulations #{winner}!"
        end
     end
end

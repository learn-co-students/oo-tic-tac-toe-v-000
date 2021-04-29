    class TicTacToe
      def initialize(board = Array.new(9, " "))
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
        [6,4,2]
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

      def move(index, character = "X")
         @board[index.to_i] = character
      end

      def position_taken?(index)
        if @board[index] == " " || @board[index] == "" || @board[index] == nil
        return false
        else return true
     end
   end


      def valid_move?(index)
         index.between?(0,8) && !position_taken?(index)
       end

  def turn_count
      counter = 0
        @board.each do |i|
          if i == "X" || i == "O"
            counter += 1
          end
        end
          return counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
     puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
      else
        turn
      end
      display_board
    end

    def won?
    board_empty = @board.none? { |i| i == "X" || i = "O"}
    if board_empty
      false
    else
      WIN_COMBINATIONS.each do |combo|
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
          return combo
        end
      end
     return false
  end
  end
def draw?
    !won? && full? ? true : false
end
def full?
    @board.all? { |i| i =="X" || i == "O"}
end
def over?
    won? || draw? || full? ? true : false
end

def winner
  WIN_COMBINATIONS.detect do |combo|
    if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
        return "X"
    elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        return "O"
    else
       nil
     end
end
end

def play
  until over?
    turn
end
if won?
  puts "Congratulations X!"
  puts "Congratulations O!"
elsif draw?
  puts "Cat's Game!"
end
end
end

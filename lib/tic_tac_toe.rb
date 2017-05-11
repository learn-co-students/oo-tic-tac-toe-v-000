class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def board=(board)
    @board = board
  end
  def board
    @board
  end

WIN_COMBINATIONS = [
      [0,1,2], #top row
      [3,4,5], #middle row
      [6,7,8], #bottom row
      [0,3,6], #first vertical column
      [1,4,7], #second vertical column
      [2,5,8], #third vertical column
      [0,4,8], #diagonal top left to bottom right
      [2,4,6] #diagonal top right to bottom left
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(number)
    number = number.to_i
    index = number - 1
    return index
  end

  def move(index, character = "X")
    @board[index] = character
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    elsif @board[index] == "X" || @board[index] == "O"
        true
    end
  end

  def valid_move?(index)
    if index.between?(0, 8) && position_taken?(index) == false
      true
    elsif index.between?(0, 8) && position_taken?(index) == true
      false
    else index < 0 || index > 8
      false
    end
  end

  def turn_count
    counter = 0
    @board.each do |boardplace|
      if boardplace != " "
        counter += 1
    end
  end
  return counter
  end

  def current_player
    if turn_count.even?
      return "X"
    elsif turn_count.odd?
      return "O"
      end
    end

    def turn
      puts "Please enter 1-9:"
      moveit_integer = gets.strip
      moveit = input_to_index(moveit_integer)
      if valid_move?(moveit)
        move(moveit, current_player)
      else
        turn
    end
    display_board
    end

    def won?
      WIN_COMBINATIONS.each do |win_combination|
          win_index_1 = win_combination[0]
          win_index_2 = win_combination[1]
          win_index_3 = win_combination[2]

          position_1 = @board[win_index_1]
          position_2 = @board[win_index_2]
          position_3 = @board[win_index_3]

          if (position_1 == "X" && position_2 == "X" && position_3 == "X")
            return win_combination     # return the win_combination indexes that won.
          elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
            return win_combination
          end
        end
        return false
      end

      def full?
        @board.all? {|i| i == "X" || i == "O"}
      end

      def draw?
        !won? && full?
      end

      def over?
        won? || draw? || full?
      end

      def winner
        WIN_COMBINATIONS.detect do |win_combination|
          win_index_1 = win_combination[0]
          win_index_2 = win_combination[1]
          win_index_3 = win_combination[2]

          position_1 = @board[win_index_1]
          position_2 = @board[win_index_2]
          position_3 = @board[win_index_3]

          if position_1 == "X" && position_2 == "X" && position_3 == "X"
            return "X"
          elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
            return "O"
          else
            false
          end
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

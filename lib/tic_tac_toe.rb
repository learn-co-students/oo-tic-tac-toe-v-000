class TicTacToe
  def initialize(board = nil)
    @board=board || Array.new(9," ")
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

  def input_to_index(input)
    input.to_i-1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
       index.between?(0, 8) && !position_taken?(index)
  end

   def turn_count
     @board.count {|item| item =="X" || item == "O"}
   end

   def current_player
     if turn_count.even?
      "X"
    else
      "O"
    end
   end

   def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

   def turn
     puts "Please input a number (1-9):"
     input = gets.strip
     index = input_to_index(input)
     if valid_move?(index)
       token = current_player
       move(index, token)
     else
       turn
     end
       display_board
   end

   def won?
     WIN_COMBINATIONS.detect do |win_combo|
       win_index_1 = win_combo[0]
       win_index_2 = win_combo[1]
       win_index_3 = win_combo[2]

       position_1 = @board[win_index_1]
       position_2 = @board[win_index_2]
       position_3 = @board[win_index_3]

       position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        end
    end

    def full?
      @board.all? do |position|
      position == "X" || position == "O"
        end
    end

    def draw?
      !won? && full?
    end

    def over?
      won? || draw?
    end

    def winner
      combo = won?
      if combo
        @board[combo[0]]
      end
   end

    def play
      turn until over?
        if winner
          puts "Congratulations #{winner}!"
        else
          puts "Cat's Game!"
        end
      end
end

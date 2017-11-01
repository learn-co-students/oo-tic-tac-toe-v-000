class TicTacToe
 def initialize(board = nil )
   @board = board || Array.new( 9, " ")
 end

 WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
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

 def move(index, value = "X")
    @board[index] = value
  end

  def position_taken?(index)
     if @board[index] == " " || @board[index] == "" || @board[index] == nil
       taken = false
    elsif @board[index] == "X" || @board[index] == "O"
       taken = true
    end
  end

  def valid_move?(index)
     index.between?(0,8) && !position_taken?(index)
   end

   def turn
      puts "Please enter 1-9:" #ask for input
      input = gets.strip #get input
      index = input_to_index(input) #translate input into index
      if valid_move?(index) #if index is valid for index
        current_player
        move(index) #make a move for index
        display_board #show board
      else
        turn #else ask for input again
      end
    end

  def turn_count
        @board.count {|token| token == "X" || token == "O"}
      end

  def current_player
      turn_count % 2 == 0? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.find do |win|
     win_index_1 = win[0]
     win_index_2 = win[1]
     win_index_3 = win[2]

     position_1 = @board[win_index_1]
     position_2 = @board[win_index_2]
     position_3 = @board[win_index_3]

     (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
      (position_1 == "O" && position_2 == "O" && position_3 == "O")
    end
  end

  def full?
   @board.all? { |position| position == "X" || position == "O" }
   end

   def draw?
    !won? && full?
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
      else won?
         puts "Congratulations #{winner}!"
       end
       turn 
    end
end

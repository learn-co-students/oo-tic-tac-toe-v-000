class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  #Win Combinationsx
  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [0,4,8], #diagonal 1
    [2,4,6], #diagonal 2
    ]
    
    #Display Boardx
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    #Input to Index
    def input_to_index(input)
      @input = input
      @input.to_i - 1
    end

    #Move
    def move(index, value)
      @board[index] = value
    end

    #Position Taken?
    def position_taken?(index)
      if @board[index] == "" || @board[index] == " " || @board[index] == nil
        false
      else @board[index] == "X" || @board[index] == "O"
        true
      end
    end

    #Valid Move?
    def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
    end

    #Turn
    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index)
        move(index,current_player)
        display_board
      else
        turn
      end
    end

#Turn countx
def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

#Current Playerx
def current_player
 turn_count % 2 == 0 ? "X" : "O"
end

#Won?
def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[2]] == @board[combo[0]] && position_taken?(combo[0])
    end
  end
  
#Full?
def full?
    @board.all? do |positions|
      positions == "X" || positions == "O"
    end
end

#Draw?
def draw?
  !won? && full?
end

#Over?
def over?
  draw? || won?
end

#Winner
def winner
 if won?
   combo = won?
   @board[combo[0]]
 else
   nil
 end
end

#Play
def play
  while !over?
    turn
  end
if won?
  puts "Congratulations #{winner}!"
elsif draw?
  puts "Cat's Game!"
end
end
end
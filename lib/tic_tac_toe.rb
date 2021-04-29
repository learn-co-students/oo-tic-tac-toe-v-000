class TicTacToe
  
  #arrays of winning combinations
  attr_accessor :board
  WIN_COMBINATIONS = 
  [
  [0,1,2], 
  [3,4,5], 
  [6,7,8], 
  [0,3,6], 
  [1,4,7], 
  [2,5,8], 
  [0,4,8], 
  [6,4,2], 
  ]

#initalizes the empty board
def initialize(board = nil)
  @board = Array.new(9, " ")
end

#prints the board for the user throughout the game
def display_board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#if the position is taken, returns true
def position_taken?(location)
  !(board[location] == " " || board[location].nil?)
end

#true if the move is valid
def valid_move?(input)
input.to_i.between?(1,9) && !position_taken?(input.to_i-1)
end

#plays an entire game   
def turn
  display_board
  puts "Please enter 1-9:"
  input = gets.strip
  if !valid_move?(input)
    turn
  end
  move(input, current_player)
  display_board
end

#uses modulo to determine which turn it is for the player
def current_player #removed (board) argument
  turn_count % 2 == 0 ? "X" : "O" 
end

  #NEEDS REVISION: If winning criteria are met as outlined,
  #in #WIN_COMBINATIONS, returns true, otherwise false.
  def won?
    TicTacToe::WIN_COMBINATIONS.each do |combinations|
      position_1 = @board[combinations[0]]
      position_2 = @board[combinations[1]]
      position_3 = @board[combinations[2]]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || 
        (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return combinations
      else
        false
      end
    end
    false
  end

#returns true if the board is full
def full?
  @board.detect{|entry| entry==" "}==nil ? true : false
end
 
 #returns true if nobody has won and board is full 
def draw? 
  won? == false && full? == true ? true : false
end

#determines if the game is won or a draw
def over? #
  draw? || won?
end

#counts the number of turns in the game at any point
def turn_count #
@board.count{|token| token == "X" || token == "O"}
end

# passes an X or an O to the board, depending on the turn
def move(location, token)
  @board[location.to_i-1] = token
end

#determines the winner by symbol. "X" or "O"
def winner #
  array = won?
   if array == false
    nil
  else 
    @board[array[0]] == "X" ? "X" : "O"
  end
end

#Uses #won? or #draw? to continue playing the game
def play
  until over? !=false
    turn
  end
  if won? != false
    puts "Congratulations #{winner}!"
  elsif draw? == true
    puts "Cats Game!"
  end 
end
end

#some code adapted from github user Souloist to convert
#methods from procedural to object-oriented
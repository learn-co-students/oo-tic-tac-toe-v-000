require "pry"

class TicTacToe
  attr_accessor :board
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [2,5,8], [1,4,7], [0,3,6], [0,4,8], [2,4,6]]
  
  def initialize(board = nil)
    @board = board
    @board = Array.new(9, " ")
  end
  
  def display_board(board = @board)
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts  "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    n = input.to_i 
    n - 1
  end
  
  def move(index, current_player = "X")
    @board = board
    @board[index] = current_player
  end
  
   def position_taken?(board = @board, index)
    x = board[index]
    if x == " " || x == "" || x == nil
      false
    else x == "X" || x = "O"
      true
    end
  end
  
  def valid_move?(board = @board, index)
    if index.between?(0, 8) == true && position_taken?(board = @board, index) == false
      true
    else
      false
    end
  end
  
  def turn(board = @board)
    counter = 0
    until counter.between?(1,9)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    x = index + 1 
    x += counter
    if valid_move?(board = @board, index)
      move(index, current_player(board))
      display_board(board = @board)
      break
    end
  end
end
  
  def turn_count(board = @board)
    new_board = []
    @board.each do |entry|
      if entry != " "
        new_board.push entry
        end
      end
    new_board.length
  end
  
  def current_player(board = @board)
    if turn_count(board) == 0
      "X"
      elsif turn_count(board).even?
      "X"
      elsif turn_count(board).odd?
      "O"
      end
    end
    
  


def won?(board = @board)
    WIN_COMBINATIONS.detect do |combo|
      board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" ||  board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
      end
    end
  
  def full?(board = @board)
    board.none? (" ")
  end
  
  def draw?(board = @board)
    !won?(board) && full?(board)
  end
  
  def over?(board = @board)
    won?(board) || full?(board)
  end
  
  def winner(board = @board)
    x = won?(board).to_a[0]
    if over?(board) == false
      return nil
    elsif board[x] == "X"
      return "X"
    elsif board[x] == "O"
      return "O"
    end
  end
  
  def play(board = @board)
    until won?(board = @board) || over?(board = @board) || draw?(board = @board)
    turn(board = @board)
   end
    if won?(board = @board) || over?(board = @board) || draw?(board = @board)
      if won?(board = @board)
        puts "Congratulations #{winner(board = @board)}!"
        elsif draw?(board = @board)
        puts "Cat's Game!"
      end
    end
  end
end

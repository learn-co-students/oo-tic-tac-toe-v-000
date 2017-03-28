require 'pry'

class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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
  @board[index] != " "
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
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

def turn_count
  @board.count{|turns_played| turns_played != " "}
end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |var|
      if @board[var[0]] == @board[var[1]] &&  @board[var[1]] == @board[var[2]] && position_taken?(var[0])
        return var
      end
    end
  end

  def full?
    @board.all?{|marker| marker == "X" || marker == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    if winner_chicken_dinner = won?
      @board[winner_chicken_dinner.first]
    end
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!" 
  end
end
require "pry"
class TicTacToe
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize(index = nil, board = nil)
    puts "Welcome to Tic Tac Toe!"
    @board = board || Array.new(9, " ")
    @index = index || 0
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index
    @index
  end

  def input_to_index(input)
    @index = input.to_i - 1
  end

  def move(index,token)
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    @board.count{|index| index != " "}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

  def turn
    puts "Please enter 1-9"
    input = gets.strip
    input_to_index(input)
    if valid_move?(@index)
      move(@index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]]== @board[combo[1]] &&
         @board[combo[0]]== @board[combo[2]] &&
         @board[combo[0]] != " "
        return combo
      end
    end
    return false
  end

  def full?
    @board.all?{|x_or_o| x_or_o !=" "}
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      return @board[won?[0]]
    end
    return nil
  end

end

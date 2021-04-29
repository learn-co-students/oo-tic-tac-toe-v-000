class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # bottom row
    [0,3,6],  # left column
    [1,4,7],  # Middle column
    [2,5,8],  # right column
    [0,4,8],  # cross left
    [2,4,6]  # cross right
  ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(n)
  return n.to_i - 1 ;
  end

  def move(index, char)
  @board[index]=char
  return @board
  end

  def position_taken? (index)
    if @board[index]== " " || @board[index]== "" || @board[index]== nil
      return false
    else return true
    end
  end

  def valid_move? (index)
  if !index.between?(0,8)
    return false
  elsif !position_taken?(index)
    return true
  end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      char =current_player
      move(index, char)
      display_board()
    else
      turn()
    end
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def won?
  WIN_COMBINATIONS.any? do |win_combination|
  if (
    win_combination.all? do |item|
      @board[item]=="X"
    end )
    return win_combination

  elsif (
    win_combination.all? do |item|
      @board[item]=="O"
    end )
  return win_combination
  end #end of if
  end #end of nested array
  end #end of method

  def full?
  @board.all? {|item| item=="X"  || item=="O"}
  end

  def draw?
  if !won? && full?
    return true
    end
  end

  def over?
  won? || draw? || full?
  end

  def winner
  won = won?
    if won == false || won == nil
      return nil
    else
      return @board[won?[0]]
    end
  end

  def play
    until over?
    turn
    end

    if won?
    puts "Congratulations #{winner}!"
    elsif draw?
    puts "Cat\'s Game!"
    end
  end

end #end of TTT class
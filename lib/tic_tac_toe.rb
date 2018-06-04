class TicTacToe 
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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
  def input_to_index(input)
    index = input.to_i - 1 
    index 
  end 
  def move(index, character)
    @board[index] = character
  end 
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O" 
      return true 
    elsif @board[index] == " " || @board[index] == "" 
      return false 
    end 
  end 
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end 
  def turn_count
    counter = 0 
    @board.each do |spot|
      if spot == "X" || spot == "O" 
      counter += 1 
      end 
    end 
    counter 
  end 
  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end 
  def turn 
    input = gets.strip 
    index = input_to_index(input)
    if valid_move?(index)
      character = "#{current_player}"
      move(index, character)
      display_board
    else 
      turn 
    end 
  end 
  def won?
    WIN_COMBINATIONS.detect do |wins|
      win1 = wins[0]
      win2 = wins[1]
      win3 = wins[2]
      if @board[win1] == "X" && @board[win2] == "X" && @board[win3] == "X"
        wins 
      elsif @board[win1] == "O" && @board[win2] == "O" && @board[win3] == "O"
        wins
      end 
    end 
  end 
  def full?
    @board.all? do |spot|
      spot == "X" || spot == "O"
    end 
  end 
  def draw?
    !won? && full?
  end
  def over?
    won? || draw?
  end 
  def winner
    winnerwinner = won?
    if over?
      return @board[winnerwinner.first]
    end 
  end 
  def play 
    puts "Please enter 1-9:"
    until over?
      turn 
    end 
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end 
  end 
end 


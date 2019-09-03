class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
  ]
  
  def initialize
    @board = Array.new(9," ")
  end
  
  def display_board
    puts "-----------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts "-----------"
  end
  
  def input_to_index(input)
    index = input.to_i - 1
    index
  end
  
  def move(i, token)
    @board[i] = token
  end
  
  def position_taken?(index)
    if @board[index] != " "
      return true
    else
      return false
    end
  end
  
  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      return true
    else
      return false
    end
  end
  
  def turn_count
    @board.count { |x| x != " " }
  end
  
  def current_player
    return "X" if turn_count.even?
    return "O" if turn_count.odd?
  end
  
  def turn
    puts "Please enter a number (1-9)"
    input = gets.chomp
    i = input_to_index(input)
    if valid_move?(i)
      move(i, current_player)
      display_board
    else
      puts "Sorry. Invalid move."
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      ttt = []
      combo.each do |x|
        ttt << @board[x]
      end
      return combo if ttt.uniq.count == 1 && !ttt.any?(" ")
    end
    return false
  end
  
  def full?
    !@board.any?(" ")
  end
  
  def draw?
    return true if full? && !won?
    return false if !full? || won?
  end
  
  def over?
    return true if draw? || won?
    return false if !full?
  end
  
  def winner
    return @board[won?[0]] if won?
  end
  
  def play
    while !over?
      turn
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end
end
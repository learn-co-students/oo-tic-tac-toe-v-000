class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end


 def input_to_index(input)
   @u = input.to_i
   @u - 1
 end

 def move(index, token = "X")
  @board[index] = token
 end

 def position_taken?(index)
   !(@board[index].nil? || @board[index] == " ")
 end

 def valid_move?(index)
   index.between?(0, 8) && !position_taken?(index)
 end

  def turn
    puts "Please enter a number (1-9):"
    i = gets.strip
    display_board
    index = input_to_index(i)
    n = valid_move?(index)
    if n == true
      move(index, current_player)
    else
      until n == true
    display_board
    i = gets.strip
    index = input_to_index(i)
    n = valid_move?(index)
    move(index, current_player)
  end
 end
end

 def won?
  WIN_COMBINATIONS.find do |win_combination|
    @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[0]] == @board[win_combination[2]] && position_taken?(win_combination[1])
  end
 end

  def full?
    @board.none? do |i|
      i == " " || i.nil?
    end
  end

  def draw?
    won? == nil && full? == true
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
    else
      puts "Congratulations #{winner}!"
    end
  end
end

class TicTacToe

  def initialize(board=nil)
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
  [6,4,2]
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

  def move(index, player)
    @board[index] = player
  end

  def position_taken? (index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    if position_taken?(index)  == false && index.between?(0,8)
      return true
    else
      return false
    end
  end

  def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  until valid_move?(index)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
  end
    player = current_player
    move(index, player)
    display_board
end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def won?
    indexes = Array.new
    if WIN_COMBINATIONS.any? do |combination|
      indexes = combination
      (@board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X") || (@board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O")
    end
      return indexes
    else
      return false
    end
  end

  def full?
    @board.all? {|position| position == "X" || position == "O"}
  end

  def draw?
    if full? == true && won? == false
      return true
    elsif
      full? == false && won? == false
      return false
    else
      false
    end
  end

  def over?
    if won? != false || draw? == true || full? == true
      return true
    else
      return false
    end
  end

  def winner
    if won? == false
      return nil
    end
    won?.each do |position|
      if @board[position] == "X"
        return "X"
      else @board[position] == "O"
        return "O"
      end
    end
  end

  def play
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

class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # Right column
    [1,4,7],   # Middle column
    [2,5,8],  # Left column
    [0,4,8],  # Right diagonal
    [2,4,6]   # Left diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
      (user_input).to_i-1
    end

  def move(index, token)
@board[index] = token
    end

  def position_taken?(index)
      if @board[index] == " " || @board[index] == "" || @board[index] == nil
          false
      elsif @board[index] == "X" || @board[index] == "O"
          true
      end
      end

  def valid_move?(index)
        if position_taken?(index) == false && index.between?(0, 8)
        true
      end
    end


  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
end

def turn
  @board
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else turn
  end
end

def won?

WIN_COMBINATIONS.each do |win_combination|
  if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
    return win_combination
  elsif
    @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
    return win_combination
  end
end
else
  return false
end

def full?
  @board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?
full? == true && won? == false
end

def over?
  !won? == false || draw? == true || full? == true

end

def winner
 return @board[won?[0]] if won?
end

  def play
      @board
      while !over?
      turn
  end

  if won?
      puts "Congratulations #{winner(@board)}!"

  elsif draw?
       puts "Cats Game!"
    end
end
end

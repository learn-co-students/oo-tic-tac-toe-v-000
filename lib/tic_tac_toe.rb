class TicTacToe

  def initialize
    @board =  Array.new(9, " ")
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

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    @board[index] == ' ' || @board[index].nil? ? false : true
  end

  def valid_move?(index)
  !position_taken?(index) && index.between?(0, 8) ? true : false
end

def turn_count
  @board.count { |input| input == 'X' || input == 'O' }
end

def current_player
  turn_count.even? ? 'X' : 'O'
end

def turn
  puts 'Please enter 1-9:'
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.find do |win_combos|
    if @board[win_combos[0]] == @board[win_combos[1]] && @board[win_combos[1]] == @board[win_combos[2]] && position_taken?(win_combos[0])
      return win_combos
    end
  end
  return false
end

def full?
  @board.all? {|filled| filled == 'X' || filled == 'O'}
end

def draw?
  full? && !won?
end

def over?
  won? || draw?
end

def winner
  if win_combos = won?
   return @board[win_combos[0]]
  else
    return nil
  end
end

def play
  turn until over?
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat\'s Game!" 
    end
   end
   
end


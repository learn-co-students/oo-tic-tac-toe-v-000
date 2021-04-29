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

def input_to_index(user_input)
  user_input.to_i
  user_input.to_i - 1
end

def move(index, character)
  @board[index] = character
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  !position_taken?(index) && index.between?(0, 8)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
    end
end

 def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def won?
    #board.all?{|i| i == " " || i == "" || i == "X"}
    WIN_COMBINATIONS.detect do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]
      if @board[win_index_1] == @board[win_index_2] && @board[win_index_2] == @board[win_index_3] && @board[win_index_1] != " "
        return win_combo
      end
    end
   return false
  end

  def full?
    @board.all?{|i| i == "X" || i == "O"}
   end

   def draw?
   !won? && full?
   end

   def over?
    draw? || won?
   end

  def winner
    if win_combo = won?
      @board[win_combo[0]]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts  "Congratulations #{winner}!"
    elsif  draw?
      puts "Cat's Game!"
    end
   end
end

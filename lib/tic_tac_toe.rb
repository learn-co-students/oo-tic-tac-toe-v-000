class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  # Define your WIN_COMBINATIONS constant
    WIN_COMBINATIONS = [
      [0,1,2], #Top row
      [3,4,5], #Middle row
      [6,7,8], #Bottom row
      [0,3,6], #1st vertical
      [1,4,7], #2nd vertical
      [2,5,8], #3rd vertical
      [0,4,8], #diagonal
      [2,4,6]  #diagonal
    ]

    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
      @index = input.to_i - 1
    end

    def move(index, token = "X")
      @board[index] = token
    end

    def position_taken?(index)
      if @board[index] == nil || @board[index] == " " || @board[index] == ""
        false
      else @board[index] == "X" || "O"
        true
      end
    end

    def valid_move?(index)
      if !position_taken?(index)
        true
        if index.between?(0, 8)
        true
      end
      end
    end

    def turn_count
      counter = 0
      @board.each do |position|
      if position == "X" || position == "O"
        counter += 1
      end
      end
      return counter
    end

def current_player
 if turn_count % 2 == 0
   return "X"
 else
   return "O"
 end
end

def turn
  puts " Please enter 1 - 9 "
  input = gets.strip
  index = input_to_index(input)
  #valid_move?(index)
  #current_player
  validation = valid_move?(index)

  if !validation
    puts "Please enter 1-9:"
    turn
  else
    move(index, current_player)
    display_board
  end
end

def won?

 WIN_COMBINATIONS.each do |win_index|

  position_1 = @board[win_index[0]]
  position_2 = @board[win_index[1]]
  position_3 = @board[win_index[2]]

  if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
    return win_index
  end
  end
 false

end

def full?
  @board.all? {|full_board| full_board == "X" || full_board == "O"}
end

def draw?
  if won? == false && full? == true
     true
  end

end

def over?
  if draw?
    true
  elsif won? && full?
    true
  elsif won? && !full?
    true

  end
end

def winner
  #token = board[0] == board[1]
  value = won?
  #binding.pry
  if value
    @board[value[0]]
  else
    nil
  end
end

def play
until over?
  turn
end

if winner == "X"
  puts "Congratulations X!"
elsif winner == "O"
  puts "Congratulations O!"
else draw?
  puts "Cat's Game!"
end
end
end

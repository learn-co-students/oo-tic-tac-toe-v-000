class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end


  WIN_COMBINATIONS = [
  [0, 1, 2], #Top row
  [3, 4, 5], #Middle row
  [6, 7, 8], #Bottom row
  [0, 3, 6], #Left column
  [1, 4, 7], #Middle column
  [2, 5, 8], #Right column
  [0, 4, 8], #left diagonal
  [2, 4, 6]  #Right diagnal
]


def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player)
  @board[index] = current_player
end


def position_taken?(index)
  if (@board[index] == " " || @board[index] == "" || @board[index] == nil)
    false
  else
    true
  end
end


def valid_move?(index)
  if index.between?(0, 8) && !position_taken?(index)
    true
  else
    false
  end
end


def turn_count
  counter = 0
  @board.each do |turn|
    if (turn == "X")||(turn == "O")
    counter += 1
    end
  end
  counter
end


def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end


def turn
puts "Please enter 1-9:"
  user_input = gets.strip
  input_to_index(user_input)

  index = user_input.to_i - 1
  if valid_move?(index)
    move(index, current_player)

    display_board
  else
        turn
      end
    end


    def won?
      WIN_COMBINATIONS.detect do |win_combination|
          if (@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X") || (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O")
        return win_combination
      else
        false
        end
      end
    end


    def full?
      @board.all? do |index|
        if index == " "
           false
         else
           true
        end
      end
    end


    def draw?
      if !won? && full?
        true
      else
        false
      end
    end


    def over?
      if won? ||full? ||draw?
        true
      else
        false
      end
    end


    def winner
      WIN_COMBINATIONS.detect do |win_combination|
          if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
            return "X"
          elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
            return "O"
          else
        end
      end
    end


    def play
      until over?
      turn
    end
    if won?
      puts"Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
      end
    end

end

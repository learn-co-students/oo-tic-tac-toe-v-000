
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

  def input_to_index(user_input)
    index = user_input.to_i
    index -=1
    return index
  end

  def move(index, current_player="X")
    @board[index] = current_player
  end

  def position_taken?(index)
    @board[index]== "X" || @board[index]== "O"
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    turn = 0
    @board.each do |index|
      if index == "X" || index == "O"
        turn += 1
      end
      end
      return turn
    end

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        puts "That is an invalid move, please enter 1-9:"
        turn
      end
  end

  def current_player
    num_turns = turn_count
      if num_turns % 2 == 0
          player = "X"
        else
          player = "O"
        end
        return player
      end

    def won?
      WIN_COMBINATIONS.detect do|combo|
        @board[combo[0]] == @board[combo[1]] &&
          @board[combo[1]] == @board[combo[2]] &&
          position_taken?(combo[0])
      end
    end

    def full?
  @board.all? { |token| token == 'X' || token == 'O' }
end

def draw?
  !won? && full?
end

def over?
  won? || draw?
end

def winner
  if winning_combo = won?
    @board[winning_combo.first]
  end
end

def play
  turn until over?
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end

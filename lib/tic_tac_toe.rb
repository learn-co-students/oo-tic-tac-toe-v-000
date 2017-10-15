class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #Top Row
    [3,4,5], #Middle Row
    [6,7,8], #Bottom Row
    [0,4,8], #Diagonal Right
    [2,4,6], #Diagonal Left
    [0,3,6], #Left Column
    [1,4,7], #Middle Column
    [2,5,8]  #Right Column
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
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  @input = gets.strip
  @index = input_to_index(@input)
  if valid_move?(@index)
    move(@index, current_player)
    display_board
  else
    turn
  end
end

def turn_count
    counter = 0
    @board.each do |arrayCell|
      if arrayCell != " "
        counter += 1
      end
    end
    return counter
  end

  def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end

    def won?
    WIN_COMBINATIONS.detect do |combo|

        position_1 = @board[combo[0]] # load the value of the board at win_index_1
        position_2 = @board[combo[1]] # load the value of the board at win_index_2
        position_3 = @board[combo[2]] # load the value of the board at win_index_3

        position_1 == position_2 && position_2 == position_3 && position_taken?(combo[0])
    end
    end

    def full?
  @board.all? {|element| element == "X" || element == "O"}
end

def draw?
!won? && full?
end

def over?
won? || draw?
end

def winner
  if won?
      @board[won?[0]]
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

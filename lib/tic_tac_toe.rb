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
  [6,4,2]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
    s = user_input.to_i
    s - 1
 end

def move(location, player = "X")
  @board[location] = player

end

def position_taken?(location)
  !(@board[location].nil? || @board[location] == " ")
end

def valid_move?(input)
  input.between?(0,8) && !position_taken?(input)
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

def turn
    puts "Please enter 1-9:"
    i = gets.strip
    index = input_to_index(i)
    m = valid_move?(index)
    if m == true
      move(index, current_player) && display_board
    else m == false
      until m == true
        puts "Sorry, that was an invalid move. Please enter 1-9:"

        i = gets.strip
        index = input_to_index(i)
        m = valid_move?(index)
        move(index, current_player)
      end
    end
  end

  def won?
    WIN_COMBINATIONS.find do |win_combo|
      @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[0]] == @board[win_combo[2]] && position_taken?(win_combo[1])
    end
  end


def full?
  @board.all?{|token| token == "X" || token == "O"}
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
    else won?
       puts "Congratulations #{winner}!"
     end
  end
end

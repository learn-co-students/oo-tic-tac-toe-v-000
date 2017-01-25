class TicTacToe
  def initialize(board=[" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end

  def board=(board)
    @board = board
  end

  def board
    @board
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

  def display_board()
    @board
      puts " #{board[0]} | #{board[1]} | #{board[2]} "
      puts "-----------"
      puts " #{board[3]} | #{board[4]} | #{board[5]} "
      puts "-----------"
      puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def position_taken?(index)

    @board[index] != " "
end

  def valid_move?(index)
    if index.between?(0,8)
      @board[index] == " "
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.count{|space| space != " "}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
    #   return "X"
    # else
    #   return "O"
    # end
  end

  def won?
      WIN_COMBINATIONS.find do |combos|
        board[combos[0]] ==
        board[combos[1]] &&
        board[combos[1]] ==
        board[combos[2]] &&
        position_taken?(combos[0])
    end
  end

  def full?
    board.all? {|token| token == "X" || token == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if winCombo = won?
      board[winCombo.first]
    end
  end

#   def play
#     turn_counter = 0
#     while turn_counter < 9
#       turn
#       turn_counter += 1
#     end
#   end
# end

def play
   turn until over?
   puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
 end
end

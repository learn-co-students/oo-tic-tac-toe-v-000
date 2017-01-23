class TicTacToe
#initialize
  def initialize(board = Array.new(9, " "))
    @board = board
    puts "Welcome to Tic Tac Toe!"
    display_board
  end

#WIN_COMBINATIONS
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

#DISPLAY_BOARD
  def display_board
    puts " #{@board[0]} " "|" " #{@board[1]} " "|" " #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} " "|" " #{@board[4]} " "|" " #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} " "|" " #{@board[7]} " "|" " #{@board[8]} "
  end
#INPUT_TO_INDEX
  def input_to_index(user_input)
    user_input.to_i - 1
  end

#MOVE
  def move(index, token)
    @board[index] = token
  end
#POSITION_TAKEN
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      return false
    end
  end

#VALID_MOVE
  def valid_move?(index)
    index.between?(0,8) && !(position_taken?(index))
  end

#TURN_COUINT
  def turn_count
    @board.count{|space| space == "X" || space == "O"}
  end

#CURRENT_PLAYER
  def current_player
    current_player = turn_count % 2 == 0 ? "X" : "O"
  end

#TURN
  def turn
    puts "Please enter a number (1-9):"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end

#GAMES STATUSES
  #WON
  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && position_taken?(win_combination[0])
    end
  end

  #FULL
  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end

  #DRAW
  def draw?
    !(won?) && full?
  end

  #OVER
  def over?
    won? || draw?
  end

#WINNER
  def winner
    if win_combo = won?
      @board[win_combo.first]
    end
  end


#PLAY THE GAME
  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end

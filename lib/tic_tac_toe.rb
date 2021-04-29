# CLASS TICTACTOE: DEFINES MAIN GAME CLASS
#INITIALIZE: INITIALIZATION METHOD
# @BOARD = INSTANCE VARIABLE
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

# ALL POSSIBLE WINNING COMBINATIONS
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6],
  [0, 4, 8]
  ]

#DISPLAY_BOARD: DISPLAYS EMPTY GAME BOARD
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

#INPUT_TO_INDEX: CONVERTS USER INPUT -> BOARD ARRAY INDEX
  def input_to_index(input)
    input.to_i - 1
  end

#MOVE: DEFINES USER MOVE
  def move(index, token = "X")
    @board[index] = token
  end

#POSITION_TAKEN?: RETURNS TRUE IF POSITION = AVAILABLE
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end

#VALID_MOVE?: RETURNS TRUE IF MOVE = VALID
  def valid_move?(index)
    if position_taken?(index) != true && index.between?(0, 8)
      return true
    else
      return false
    end
  end

#TURN_COUNT: RETURNS MOVES PLAYED
  def turn_count
    @board.count {|token| token == "X" || token == "O"}
  end

#CURRENT_PLAYER: RETURNS CURRENT PLAYER
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

#TURN: TURN CYCLE
  def turn
    puts "Select your move: "
    input = gets.strip
    index = input_to_index(input)
    token = current_player

    if valid_move?(index) == true
      move(index, token)
      display_board
    else
      turn
    end
  end

#WON?: RETURNS FALSE IF WINNING COMBINATION != PRESENT
  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|token| @board[token] == "X"}
        return combo
      elsif combo.all? {|token| @board[token] == "O"}
        return combo
      end
    end
    return false
  end

#FULL?: RETURNS TRUE IF BOARD = FULL
  def full?
    if @board.any? {|index| index != "X" && index != "O" }
      return false
    else
      return true
    end
  end

#DRAW?: RETURNS TRUE IF GAME = DRAW
  def draw?
    if full? == true && won? == false
      return true
    else
      return false
    end
  end

#OVER?: RETURNS TRUE IF GAME = OVER
  def over?
    if draw? == true || full? == true || won?
      return true
    else
      return false
    end
  end

#WINNER: RETURNS WINNING PLAYER
  def winner
    if won?
      return @board[won?[0]]
    end
  end

#PLAY: EXECUTES GAME LOOP
  def play
    until over? == true
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat\'s Game!"
    end
  end
  
end

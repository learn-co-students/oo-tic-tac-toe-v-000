class TicTacToe
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
#initialize with empty game board
  def initialize(board = Array.new(9, " "))
    @board = board
  end
#display board by printing formatted board variable
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
#Coverts users input to correct index
  def input_to_index(input)
    @input = input.to_i - 1
  end
  #accepts index and value and assigns it appropriately
  def move(index, value = "X")
    @index = index
    @value = value
    @board[@index] = @value
  end
  #accepts index and checks if position is available
  def position_taken?(index)
    @index = index
    if @board[@index] == "" || @board[@index] == " "
      return false
    else
      return true
    end
  end
  #accepts @index and check board bounds and avail
  def valid_move?(index)
    @index = index
    if @index.between?(0, 8) && position_taken?(@index) == false
      return true
    else
      return false
    end
  end
  #returns current turn by counting empty positions
  def turn_count
    return @board.count("X") + @board.count("O")
  end
  #returns current player
  def current_player
    return turn_count % 2 == 0 ? "X" : "O"
  end
  #'gets' user input and executes the turn
  def turn
    puts "Please enter 1-9:"
  @input = gets
  @index = input_to_index(@input)

  if valid_move?(@index) == true
    move(@index, current_player)
    display_board
  else
    turn
    end
  end
  #check if anyone won
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
    end
  end
  return false
  end
  #check if board is full, return true for a draw, false for a in progress game
  def full?
    @board.each do |i|
    if i == "" || i == " "
      return false
    end
  end
  end
  #check for a draw, return false for won game, false for in-progress game
  def draw?
    if won? == false
  if !full? == false
    return true
  elsif full? == false
    return false
    end
  end
end
  #check if game over, return true for draw, true for won, false for in-progress game
def over?
    if !won? == false || draw? == true || !full? == false
    return true
  else
    return false
  end
end
  #return X or O on win, nil when no winner
  def winner
    if winner = won? == false
      return nil
    else
      win_token = @board[won?[0]]
    end
    if win_token == "X"
      return "X"
    elsif win_token == "O"
      return "O"
     end
  end
  #play the game
  def play
  if over? == false
    turn
    play
  elsif over? == true
    if !won? == false
        puts "Congratulations #{winner}!"
      elsif draw? == true
        puts "Cat's Game!"
      end
    end
  end
end

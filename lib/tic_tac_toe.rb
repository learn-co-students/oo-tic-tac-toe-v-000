class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

#defining WIN_COMBINATIONS constants
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
#display_board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  #input_to_index
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  #turn
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
  #move
  def move (index, current_player)
    @board[index] = current_player
  end
  #valid_move
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  #position_taken
  def position_taken?(index)
    taken = nil
    if (@board[index] ==  " " || @board[index] == "" || @board[index] == nil)
      taken = false
    else
      taken = true
    end
  end

  #won method
  def won?
    WIN_COMBINATIONS.detect do |winning|
      @board[winning[0]] == @board[winning[1]] &&
      @board[winning[1]] == @board[winning[2]] &&
      position_taken?(winning[0])
    end
  end
  #full
  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end
  #draw
  def draw?
    full? && !won?
  end
  #over
  def over?
    full? || won? || draw?
  end
  #winner
  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end
  #play
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end
end

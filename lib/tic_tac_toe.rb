class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #first column
  [1,4,7], #second column
  [2,5,8], #third column
  [0,4,8], #diagonal top left to bottom right
  [2,4,6]  #diagonal top right to bottom left
]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  #gets user input 1-9 as a string and converts to an integer 0-8
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index,value = "X")
    @board[index] = value
  end

  def position_taken?(index)
    !(@board[index] == "" || @board[index] == " ")
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    counter = 0
    @board.each do |move|
      if move == "X" || move == "O"
        counter += 1
      end
    end
    counter
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X":"O"
  end

  def won?
    WIN_COMBINATIONS.find do |win_combo|
      @board[win_combo[0]] == @board[win_combo[1]] &&
      @board[win_combo[0]] == @board[win_combo[2]] &&
      position_taken?(win_combo[0])
    end
  end

  def full?
    @board.all? do |index| index == "X" || index == "O"
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won? != nil
      winner = @board[won?[0]]
    end
  end

  def play
    until over? == true || draw? == true || won?
      turn
    end
    if draw? == true
         puts "Cat's Game!"
    else won?
       puts "Congratulations #{winner}!"
    end
  end
end

class TicTacToe
  def initialize(board = Array.new(9, " "))
    @board = board
  end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Left diagonal
  [2,4,6] # Right diagonal
  ]
  # Define won?(board)

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

  def move(index, the_current_player)
    @board[index] = the_current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
          move(index, current_player)
          display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |xo|
      if xo == "X" || xo == "O"
      counter += 1
      end
    end
    return counter
  end

  def current_player
    turn_count % 2 == 1 ? "O" : "X"
  end

  def won?
          WIN_COMBINATIONS.detect do |winning_array|
            @board[winning_array[0]] != " " && @board[winning_array[0]] != "" &&
            @board[winning_array[0]] == @board[winning_array[1]] &&
            @board[winning_array[1]] == @board[winning_array[2]]
          end
  end

  def full?
    @board.all? do |letter|
      letter == "X" || letter == "O"
    end
  end

  def draw?
    full? == true && won? == nil
  end

  def over?
    won? || draw?
  end

  def winner
    if won? == nil
      return nil
    else
      return @board[won?[1]]
    end
  end

  def play
    while over? == false
      turn
    end

    if draw? == true
        puts "Cat's Game!"
    end

    if won? != nil
        puts "Congratulations #{winner}!"
    end
  end

end

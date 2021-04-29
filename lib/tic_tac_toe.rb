class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom Row
  [0,3,6],  # Left Column
  [1,4,7], # Middle Column
  [2,5,8],  # Right Column
  [0,4,8], # Top Left Diagonal
  [6,4,2]  # Top Right Diagonal
 ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(input, character = "X")
    @board[input.to_i-1] = character
  end

  def position_taken?(position)
    !(@board[position] == " " || @board[position] == "" || @board[position] == nil)
  end

  def valid_move?(position)
    if position_taken?(position.to_i-1)
      false
    elsif position.to_i-1 > 8
      false
    elsif position.to_i-1 < 0
      false
    else
      true
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
      if valid_move?(input)
        move(input,character = current_player)
      else
        turn
      end
    display_board
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    counter = 0
    @board.each do |slot|
      if slot == "X"
        counter += 1
      elsif slot == "O"
        counter += 1
      end
    end
    counter
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @board[win_combination[0]] == @board[win_combination[1]] &&
      @board[win_combination[1]] == @board[win_combination[2]] &&
      position_taken?(win_combination[0])
    end
  end

  def full?
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end

  def draw?
    if full? == true && !won? == true
      true
    else
      false
    end
  end

  def over?
    won? || draw?
  end

  def winner
    if winning_list = won?
      @board[winning_list.first]
    else
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end
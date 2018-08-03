class TicTacToe

  def initialize(board = nil)
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  WIN_COMBINATIONS = [
      [0, 1, 2], #top
      [3, 4, 5], #middle
      [6, 7, 8], #bottom
      [0, 3, 6], #|
      [1, 4, 7], # |
      [2, 5, 8], #  |
      [0, 4, 8], #\
      [2, 4, 6]
    ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i-1
  end

  def move(index, player="X")
    @board[index] = player
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    position_taken?(index) == false && index.between?(0, 8) #because .between? is NOT a local method
  end

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

  def turn_count
    turn = 0
    @board.each {|index|
      if index == "X" || index == "O"
        turn +=1
      end}
    return turn
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.find { |combo|
    @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[2]] != " "}
  end

  def full?
    @board.none? { |index| index == " "} && !won?
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if won?
      return @board[won?[0]]
    else
      return nil
    end
  end

  def play
    while over? == false
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end

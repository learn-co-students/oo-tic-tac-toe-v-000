class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

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

  def move(index, player = "X")
    @board[index] = player
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != "" && @board[index] != nil
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.chomp.to_i
    position = input_to_index(user_input)
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      puts "That spot has already been taken."
      turn
    end
  end

  def turn_count
    num_of_turns = 0
    @board.each do |spot|
      if spot == "X" || spot == "O"
        num_of_turns += 1
      end
    end
    return num_of_turns
  end

  def current_player
    num_of_turns = turn_count
    num_of_turns.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      @board[combination[0]] == @board[combination[1]] &&
      @board[combination[1]] == @board[combination[2]] &&
      position_taken?(combination[0])
    end
  end

  def full?
    @board.all? {|token| token == "X" || token == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    else
      puts "Something messed up..."
    end
  end

end

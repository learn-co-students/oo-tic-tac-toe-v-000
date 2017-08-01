class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
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

  def move(position, current_player = "X")
    @board[position] = current_player
  end

  def position_taken?(position)
    @board[position] != " " && @board[position] != ""
  end

  def valid_move?(position)
    position.between?(0,8) && !position_taken?(position)
  end


  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    position = input_to_index(user_input)

    if valid_move?(position) == true
      current_token = current_player
      move(position, current_token)
      display_board
    else
      turn
    end
  end

  def turn_count
    number_of_turns = 0
    @board.each do |position|
      if position != " "
        number_of_turns += 1
      end
    end
    return number_of_turns
  end

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @board[win_combination[0]] == @board[win_combination[1]] \
      && @board[win_combination[2]] == @board[win_combination[1]] \
      && @board[win_combination[0]] != " "
    end
  end

  def full?
    open_spaces = @board.select do |position|
      position == " "
    end
      return open_spaces.length <= 0
  end

  def draw?
   full? && !won?
  end

  def over?
    full? || won? || draw?
  end

  def winner
    winning_positions = won?
    # returns nil unless winning_positions is truthy
    return nil unless winning_positions
    return @board[winning_positions[0]]
  end

  def play
    while !over? #while CONDITION == TRUE do something, else stop
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end


end

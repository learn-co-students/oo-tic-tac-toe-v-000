class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(position, value)
    @board[position] = value
  end

  def position_taken?(position)
    ![nil, " "].include?(@board[position])
  end

  def valid_move?(position)
    highest_possible_position = 8
    lowest_possible_position = 0

    position <= highest_possible_position &&
    position >= lowest_possible_position &&
    !position_taken?(position)
  end

  def turn
    puts "Please enter 1-9:"

    input = gets.strip
    index = input_to_index(input)

    if valid_move?(index)
      # TODO put current player here
      move(index, current_player)
      display_board
    else
      turn
    end

  end

  # TODO this feels really messy. Lots of mutable state...
  def turn_count
    turn_counter = 0
    (@board.length).times do |i|
      if position_taken?(i)
        turn_counter += 1
      end
    end

    return turn_counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    # confirm that there are three of the same token at the indices defined in win combinations
    WIN_COMBINATIONS.detect do |combination|
      position_1 = @board[combination[0]]
      position_2 = @board[combination[1]]
      position_3 = @board[combination[2]]

      # TODO look at on 6/21 and consider to refactoring
      ([position_1, position_2, position_3].all? { |elt| elt == "X"} ||
      [position_1, position_2, position_3].all? { |elt| elt == "O"})

    end
  end

  # TODO Bad Style
  def full?
    i = 0
    @board.all? do |position|
      result = position_taken?(i)
      i += 1
      result
    end
  end

  # is the board full and there is no winner
  def draw?
    full? && !won?
  end

  # returns true if the board has been won, is a draw, or is full
  def over?
    won? || draw? || full?
  end

  def winner
    if winning_positions = won?
      first_winning_board_element = @board[winning_positions[0]]
    end
  end

  def congratulate(winner)
    puts "Congratulations #{winner}!"
  end

  def draw_message
    puts "Cat's Game!"
  end

  # currently on the play loop
  def play
    until over?
      turn
    end

    if won?
      congratulate(winner)
    elsif draw?
      draw_message
    end

  end

end

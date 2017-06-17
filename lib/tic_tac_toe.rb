class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS =
  [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Left to right diagonal
    [2,4,6], # Right to left diagonal
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

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
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
    num_occupied = 0
    @board.each do |spot|
      if spot != " "
        num_occupied += 1
      end
    end
    num_occupied
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      char_at_position_1 = @board[win_index_1]
      char_at_position_2 = @board[win_index_2]
      char_at_position_3 = @board[win_index_3]

      if char_at_position_1 == "X" && char_at_position_2 == "X" && char_at_position_3 == "X"
        puts "The win combination is: #{win_combination}"
        return win_combination
      elsif
        char_at_position_1 == "O" && char_at_position_2 == "O" && char_at_position_3 == "O"
        puts "The win combination is: #{win_combination}"
        return win_combination
      end
    end
    false
  end

  def full?
    !@board.any? {|x| x == " "}
  end

  def draw?
    if full? && !won?
      true
    else
      false
    end
  end

  def over?
    (won? || full? || draw?)
  end

  def winner
    if won?
      @board[won?[0]]
    else
      nil
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end

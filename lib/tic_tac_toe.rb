class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    index = user_input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    elsif @board[index] == "X" || @board[index] == "O"
      return true
    end
  end

  def valid_move?(index)
    if position_taken?(index) != true && index.between?(0,9)
      true
    end
  end

  def turn_count
    number_of_turns = 0
    @board.each do |position|
      if position == "X" || position == "O"
        number_of_turns += 1
      end
    end
    number_of_turns
  end

  def current_player
    if turn_count.odd?
      "O"
    else
      "X"
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    char = current_player
    if valid_move?(index)
      move(index, char)
      display_board
    else
      puts "This is an invalid move!"
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      first_spot = @board[win_combo[0]]
      second_spot = @board[win_combo[1]]
      third_spot = @board[win_combo[2]]

      if first_spot == "X" && second_spot == "X" && third_spot == "X"
        return win_combo
      elsif first_spot == "O" && second_spot == "O" && third_spot == "O"
        return win_combo
      end
    end
    return false
  end

  def full?
    @board.all?{|i| i == "X" || i == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    if won?
      return true
    elsif draw?
      return true
    elsif full?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      return @board[won?[0]]
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

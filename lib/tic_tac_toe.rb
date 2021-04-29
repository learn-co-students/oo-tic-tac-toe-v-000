class TicTacToe

  attr_accessor :input_to_index

  WIN_COMBINATIONS = [

    [0,1,2], # Horizontal Top Row
    [3,4,5], # Horizontal Middle Row
    [6,7,8], # Horizontal Bottom Row
    [0,3,6], # Vertical Left Row
    [1,4,7], # Vertical Middle Row
    [2,5,8], # Vertical Right Row
    [0,4,8], # Backward Slash
    [2,4,6] # Forward Slash

  ]

  def initialize(board = nil)

    @board = board || Array.new(9, " ")

  end

  def display_board

    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end

  def input_to_index(input)

    @input = input.to_i - 1

  end

  def move(index, token = "X")

    @board[index] = token

  end

  def position_taken?(index)

    !(@board[index].nil? || @board[index] == " ")

  end

  def valid_move?(index)

    if index.between?(0,8) && !(position_taken?(index))
      true
    else
      nil
    end

  end

  def turn_count

    turns = 0

    @board.each do |i|
      if i == "X" || i == "O"
        turns += 1
      end
    end

    return turns

  end

  def current_player

    counter = turn_count
    turn = counter.even? ? "X" : "O"

    return turn
  end

  def turn

    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player

    if valid_move?(index)
      move(index, token)
      display_board()
    else
      turn()
    end

  end

  def won?

    if (@board[0] == "X" && @board[1] == "X" && @board[2] == "X") || (@board[0] == "O" && @board[1] == "O" && @board[2] == "O")
      return WIN_COMBINATIONS[0]
    elsif (@board[3] == "X" && @board[4] == "X" && @board[5] == "X") || (@board[3] == "O" && @board[4] == "O" && @board[5] == "O")
      return WIN_COMBINATIONS[1]
    elsif (@board[6] == "X" && @board[7] == "X" && @board[8] == "X") || (@board[6] == "O" && @board[7] == "O" && @board[8] == "O")
      return WIN_COMBINATIONS[2]
    elsif (@board[0] == "X" && @board[3] == "X" && @board[6] == "X") || (@board[0] == "O" && @board[3] == "O" && @board[6] == "O")
      return WIN_COMBINATIONS[3]
    elsif (@board[1] == "X" && @board[4] == "X" && @board[7] == "X") || (@board[1] == "O" && @board[4] == "O" && @board[7] == "O")
      return WIN_COMBINATIONS[4]
    elsif (@board[2] == "X" && @board[5] == "X" && @board[8] == "X") || (@board[2] == "O" && @board[5] == "O" && @board[8] == "O")
      return WIN_COMBINATIONS[5]
    elsif (@board[0] == "X" && @board[4] == "X" && @board[8] == "X") || (@board[0] == "O" && @board[4] == "O" && @board[8] == "O")
      return WIN_COMBINATIONS[6]
    elsif (@board[2] == "X" && @board[4] == "X" && @board[6] == "X") || (@board[2] == "O" && @board[4] == "O" && @board[6] == "O")
      return WIN_COMBINATIONS[7]
    else
      false
    end

  end

  def full?

    if @board.all?{|i| i == "X" || i == "O"}
      return true
    else
      return false
    end

  end

  def draw?

    won = won?
    full = full?

    if won == false && full == true
      return true
    else
      return false
    end

  end

  def over?

    if won? || draw?
      return true
    else
      return false
    end

  end

  def winner

    win_combination = won?

    if win_combination == false
      return nil
    else
      return @board[win_combination[0]]
    end

  end

  def play

    until over?()
      turn()
    end

    if won?()
      puts "Congratulations #{winner()}!"
    else
      puts "Cat's Game!"
    end

  end

end

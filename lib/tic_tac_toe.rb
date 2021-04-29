class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #first column
    [1, 4, 7], #second column
    [2, 5, 8], #third column
    [0, 4, 8], #diagonal top left to bottom right
    [2, 4, 6]  #diagonal top right to bot
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    @index = user_input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && position_taken?(index) == false
      true
    else
      false
    end
  end

  def turn_count
    return @board.length - @board.count(" ")
  end

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please input a number between 1 and 9"
    input = input_to_index(gets.strip)
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |combo_array|
        win_index_1 = combo_array[0]
        win_index_2 = combo_array[1]
        win_index_3 = combo_array[2]

        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]

        if position_1 == position_2 && position_1 == position_3 && position_taken?(win_index_1)
          return [win_index_1, win_index_2, win_index_3]
        end
    end
    return false
  end

  def full?
    @board.none?{|i| i == " "}
  end

  def draw?
    if full? && !won?
      true
    else
      false
    end
  end

  def over?
    if draw? || full? || won?
      true
    else
      false
    end
  end

  def winner
    if won? != false
      return @board[won?[0]]
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
    end
  end


end
